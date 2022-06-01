# cadooz

Ruby Wrapper for the cadooz SOAP Business Order web service

## Usage

How to use my plugin.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cadooz'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install cadooz
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Publishing

To publish to our private gemserver you will first need to get the api key.

The api key can be found in vault: https://vault.bonus.ly/ui/vault/secrets/kv/show/global/gemstash

To set it correctly first check to see if you already have a file at `~/.gem/credentials` if you do
you can skip to editing that file. If not follow these steps to create it:

```shell
$ mkdir -p ~/.gem
$ touch ~/.gem/credentials
$ chmod 0600 ~/.gem/credentials
```

Once you have a credentials file you will need to add the following line to it:

```yaml
---
:private_gemserver_key: <API KEY GOES HERE>
```

Now that you have the credentials configured use the following command to push a new version to the private gemserver:

```shell
$ gem push --key private_gemserver_key --host https://rubygems.bonusly.dev/private pkg/cadooz-X.X.X.gem
```

Now you can have the applications which use this gem run bundle update to get the new version.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
