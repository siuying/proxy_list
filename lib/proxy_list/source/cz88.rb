require 'nokogiri'
require 'open-uri'

module ProxyList
  class Source
    class Cz88
      def default_urls
        links = ['http://www.cz88.net/proxy/index.aspx']
        (2..10).each do |p|
          links << "http://www.cz88.net/proxy/http_#{p}.aspx"
        end
        links
      end

      def list(options={})
        urls = options[:urls] || default_urls

        proxy_servers = []
        urls.each do |url|
          page = open(url)
          doc  = Nokogiri::HTML(page, nil, 'GBK')
          doc.xpath("//table/tr").each do |line|
            ip    = line.xpath("./td[1]").text.strip
            port  = line.xpath("./td[2]").text.strip
            next unless port =~ /^\d+$/

            proxy_servers << "#{ip}:#{port}"
          end
        end
        return proxy_servers
      end
    end
  end
end