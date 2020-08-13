# Qiscus

I shamelessly ripped ideas from https://github.com/GustavoCaso/sendbird

## Installation

```ruby
gem 'qiscus', git: 'https://github.com/rustyworks/qiscus', ref: 'a921cc'
```

Change ref to commit hash

## Requirements

Rails way:
```ruby
Qiscus.config do |c|
  c.end_point = Rails.application.secrets.qiscus_end_point
  c.api_version = Rails.application.secrets.qiscus_api_version
  c.sdk_secret = Rails.application.secrets.qiscus_sdk_secret
  c.sdk_app_id = Rails.application.secrets.qiscus_sdk_app_id
end
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
