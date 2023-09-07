require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class GoodGame < OmniAuth::Strategies::OAuth2
      option :name, "goodgame"

      option :authorize_options, [:scope]

      def request_phase
        redirect client.auth_code
                       .authorize_url({ redirect_uri: callback_url }
                       .merge(authorize_params)).gsub(/%2[b,B]/, "+")
      end
    end
  end
end
