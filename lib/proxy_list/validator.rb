require 'httparty'

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
  end
end