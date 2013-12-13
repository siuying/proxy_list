require_relative './source/xroxy_com'
require_relative './source/cx88'

module ProxyList
  class Source
    DEFAULT_SOURCES = [XroxyCom.new, Cz88.new]

    def list(sources=DEFAULT_SOURCES)
      sources.collect do |source|
        source.list
      end.flatten.uniq
    end
  end
end