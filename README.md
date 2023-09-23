## Installation

Add this lines to your application's Gemfile:

```ruby
gem 'omniauth-goodgame'
gem 'omniauth-rails_csrf_protection'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install omniauth-goodgame

## Usage

Here is an example for adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :goodgame, ENV["GOODGAME_CLIENT_ID"], ENV["GOODGAME_CLIENT_SECRET"]
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Alex1324522/omniauth-goodgame. This project is intended to be a safe, welcoming space for collaboration.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Example
Here is an example of an Auth hash that is located in `request.env['omniauth.auth']`:
```ruby
{"provider"=>"goodgame",
 "uid"=>uid,
 "info"=>
  {"name"=>"name",
   "nickname"=>"nickname",
   "email"=>"your@email",
   "channelid"=>channelid},
 "credentials"=>
  {"token"=>
    "token",
   "refresh_token"=>
    "refresh_token",
   "expires_at"=>1695420157,
   "expires"=>true},
 "extra"=>
  {"raw_info"=>
    {"id"=>id,
     "obj_key"=>"obj_key",
     "nickname"=>"nickname",
     "username"=>"username",
     "avatar"=>"/files/avatars/av_avatar_elf.png",
     "firstname"=>"firstname",
     "lastname"=>"lastname",
     "fullname"=>"fullname",
     "birthday"=>nil,
     "regdate"=>"regdate",
     "country"=>{"id"=>"id", "code"=>"code", "title"=>"Country"},
     "city"=>{"id"=>"0", "title"=>nil},
     "sex"=>0,
     "website"=>"",
     "about"=>"",
     "background"=>"/images/profile/smile_pattern.png",
     "timezone"=>{"id"=>0, "zone"=>false},
     "activated"=>1,
     "stream"=>
      {"id"=>id,
       "key"=>"key",
       "preview"=>"https://goodgame.ru/files/logotypes/ch_204504_N2ai.png",
       "title"=>"title",
       "viewers"=>0,
       "streamer"=>
        {"id"=>id,
         "obj_key"=>"obj_key",
         "nickname"=>"nickname",
         "username"=>"username",
         "avatar"=>"/files/avatars/av_avatar_elf.png"},
       "stream_key"=>"stream_key",
       "status"=>0,
       "game"=>{"id"=>0, "title"=>nil, "url"=>"/games/"},
       "poster"=>"poster_link",
       "hidden"=>true,
       "adult"=>true,
       "link"=>"https://goodgame.ru/channel/your_channel/",
       "watch_together"=>false,
       "lastseen"=>lastseen,
       "premiums"=>premiums,
       "followers"=>followers,
       "rating"=>{"value"=>value, "place"=>place}},
     "room"=>
      {"user_id"=>User_id,
       "style"=>0,
       "walls"=>
        ["/files/pics.png"],
       "exp"=>600,
       "level"=>4,
       "snapshot"=>"",
       "items"=>nil},
     "bnet"=>false,
     "rights"=>0,
     "email"=>"your@email",
     "phone"=>0}}}
```
