require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Goodgame < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = ""
      option :name, "goodgame"

      option :client_options, {
        site: "https://goodgame.ru",
        authorize_url: "/oauth2/authorize",
        token_url: "/oauth2/token",
        auth_scheme: :request_body
      }

      option :access_token_options, {
        header_format: "application/x-www-form-urlencoded",
        param_name: "access_token"
      }

      option :authorize_options, [:scope]

      def request_phase
        redirect client.auth_code
                       .authorize_url({ redirect_uri: callback_url }
                       .merge(authorize_params)).gsub(/%2[b,B]/, "+")
      end

      credentials do
        hash = { "token" => access_token.token }
        hash["refresh_token"] = access_token.refresh_token if access_token.refresh_token
        hash["expires_at"] = access_token.expires_at if access_token.expires?
        hash["expires"] = access_token.expires?
        hash
      end

      uid { raw_info["id"] }

      info do
        {
          name: raw_info["nickname"],
          email: raw_info["email"],
          nickname: raw_info["username"],
          description: raw_info["about"],
          image: raw_info["avatar"],
          urls: { Goodgame: raw_info["link"] }
        }
      end
      extra do
        {
          raw_info: raw_info
        }
      end
      def raw_info
        @raw_info ||=
          access_token.get("https://goodgame.ru/api/4/users/#{client.id}").parsed
                      .fetch("data").fetch(0)
      end

      def build_access_token
        super.tap do |token|
          token.options.merge!(access_token_options)
        end
      end

      def access_token_options
        options.access_token_options.each_with_object({}) do |(k, v), h|
          h[k.to_sym] = v
        end
      end

      def callback_url
        return options[:redirect_uri] unless options[:redirect_uri].nil?

        full_host + script_name + callback_path
      end

      def authorize_params
        super.tap do |params|
          options[:authorize_options].each do |k|
            params[k] = request.params[k.to_s] unless [nil, ""].include?(request.params[k.to_s])
          end
          params[:scope] = params[:scope] || DEFAULT_SCOPE
        end
      end
    end
  end
end
