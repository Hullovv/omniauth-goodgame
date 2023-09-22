# frozen_string_literal: true

require "sinatra"
require "omniauth"
require "omniauth-goodgame"

configure do
  set port: 3000
  set :sessions, true
end

use OmniAuth::Builder do
  provider :goodgame, ENV["GOODGAME_CLIENT_ID"], ENV["GOODGAME_CLIENT_SECRET"],
           display: "popup",
           redirect_uri: "http://127.0.0.1:3000/auth/goodgame/callback"
end

get "/" do
  <<-HTML
  <form method='post' action='/auth/goodgame'>
    <button type='submit'>Login with goodgame</button>
    <input type="hidden" name="authenticity_token" value='#{request.env["rack.session"]["csrf"]}'>
  </form>
  HTML
end

get "/auth/:provider/callback" do
  content_type "text/plain"
  pp request.env["omniauth.auth"]
  request.env["omniauth.auth"].info.to_hash.inspect
end
