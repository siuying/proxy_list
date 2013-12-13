# Proxy List

Gather list of proxies from various sources, validate them and rotate them for use.

## Installation

Add this line to your application's Gemfile:

    gem 'proxy_list'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install proxy_list

## Usage

```ruby

# Initialize
manager = ProxyList::Manager.new

# Fetch list of proxies
manager.fetch

# Cleanup the proxy list
manager.validate

# Get first avaliable proxy, and rotate the list
manager.proxy
=> '0.0.0.0:8080'

manager.proxy
=> '1.1.1.1:8080'

manager.proxy
=> '2.2.2.2:8080'

# return all available proxy servers
manager.proxies
=> ['0.0.0.0:8080', '1.1.1.1:8080', '2.2.2.2:8080']

# remove a proxy from list
manager.delete('0.0.0.0:8080')
=> '0.0.0.0:8080'

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credit

This gem is inspired by [anonymous_proxymaster](https://github.com/rubydev/anonymous_proxymaster) gem by Marian Mrózek.

## License

MIT. See ```LICENSE.txt```.
