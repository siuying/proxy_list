require_relative './source/xroxy_com'

module ProxyList
  class Source
    DEFAULT_SOURCES = [XroxyCom.new]

    def list(sources=DEFAULT_SOURCES)
      sources.collect do |source|
        source.list
      end.flatten.uniq
    end
  end
end