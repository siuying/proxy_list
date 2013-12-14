require_relative './source/xroxy'
require_relative './source/cz88'

module ProxyList
  class Source
    DEFAULT_SOURCES = [Xroxy.new]

    def list(sources=DEFAULT_SOURCES)
      sources.collect do |source|
        source.list
      end.flatten.uniq
    end
  end
end