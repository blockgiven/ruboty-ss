# Ruboty::Ss

ruboty plugin for take a screenshot of website.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-ss'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruboty-ss

## Usage

    @ruboty ss http://example.com/

## Where screenshots go?

[Gyazo](https://gyazo.com/ja).

### How to save screenshots in Dropbox

You need to get Dropbox access token:

https://www.dropbox.com/developers/core/start/ruby

    RUBOTY_SS_STORAGE=dropbox RUBOTY_SS_DROPBOX_ACCESS_TOKEN=<YOUR_ACCESS_TOKEN> bundle exec ruboty


## Contributing

1. Fork it ( https://github.com/blockgiven/ruboty-ss/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
