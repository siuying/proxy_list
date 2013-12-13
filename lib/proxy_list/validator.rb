require 'httparty'
require 'thread/pool'

module ProxyList
  class Validator
    # validate a proxy server
    # proxy - String, proxy server in formate 'ip:port'
    # return true if proxy is valid, false otherwise
    def validate(proxy)
      server, port = proxy.split(":")
      return false if server.nil? || port.nil?

      response = HTTParty.get('http://amazon.com', :http_proxyaddr => server, :http_proxyport => port, :timeout => 10)
      response.success?

    rescue Net::OpenTimeout
      false
    rescue
      false
    end

    # validate list of proxies, and return list of valid proxy
    def validate_proxies(proxies, poolsize=10)
      results = []

      pool = Thread.pool(poolsize)
      proxies.each do |proxy|
        pool.process {
          results << {proxy: proxy, valid: validate(proxy)}
        }
      end
      pool.shutdown

      results.select {|r| r[:valid] }.collect { |r| r[:proxy] }
    end
  end
end