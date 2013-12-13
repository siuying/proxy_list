require 'nokogiri'
require 'open-uri'

module ProxyList
  class Source
    class XroxyCom
      OPTIONS_DEFAULT = {page_count: 10, country: "US"}

      def list(options={})
        options       = OPTIONS_DEFAULT.merge!(options)
        page_count    = options[:page_count]
        country       = options[:country]

        proxy_servers = []
        page_count.times do |p|
          page = open("http://www.xroxy.com/proxylist.php?pnum=#{p}&type=All_http&country=#{country}")
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