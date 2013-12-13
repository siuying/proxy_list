require 'nokogiri'
require 'open-uri'

module ProxyList
  module Sources
    module XroxyCom
      def list(options={page_count: 150})
        proxy_servers = []
        page_count    = options[:page_count] || 150
        page_count.times do |p|
          page = open("http://www.xroxy.com/proxylist.php?pnum=#{p}")
          doc  = Nokogiri::HTML(page)
          doc.xpath("//div[@id='content']/table[1]/tr").each do |line|
            ip    = line.xpath("./td[2]").text.strip
            port  = line.xpath("./td[3]").text.strip
            next unless port =~ /^\d+$/

            proxy_servers << "#{ip}:#{port}"
          end
        end
        return proxy_servers
      end
    end
  end
end