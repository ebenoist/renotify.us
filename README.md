ReNotify
---
> A websocket based notification proxy.

## Requirements

1. Ruby >= 2.0
2. Bundler

## Installation

1. `bundle install`
2. `rake start`

## Usage

> While connected to a browser with websocket support at localhost:9292

`curl -X POST localhost:9292/api/v1/messages -H "Content-Type: application/json" --data '{ "message": "foo bar", "title": "heyo" }'`

## Contributing

1. Fork it ( https://github.com/ebenoist/renotify.us/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
