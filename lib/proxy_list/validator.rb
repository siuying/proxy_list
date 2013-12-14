require 'httparty'
require 'thread/pool'

module ProxyList
  class Validator
    # validate a proxy server
    # proxy - String, proxy server in formate 'ip:port'
    # return true if proxy is valid, false otherwise
    def validate(proxy, timeout=3)
      server, port = proxy.split(":")
      return false if server.nil? || port.nil?

      response = HTTParty.get('http://amazon.com', :http_proxyaddr => server, :http_proxyport => port, :timeout => timeout)
      response.success?

    rescue Net::OpenTimeout
      false
    rescue
      false
    end

    # validate list of proxies, and return list of valid proxy
    def validate_proxies(proxies, poolsize=10, timeout=3)
      results = []

      lock = Mutex.new
      pool = Thread.pool(poolsize)
      proxies.each do |proxy|
        pool.process {
          if validate(proxy, timeout)
            lock.synchronize {
              results << proxy
            }
          end
        }
      end
      pool.shutdown

      results
    end
  end
end