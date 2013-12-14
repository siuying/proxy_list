require_relative './validator'
require_relative './source'

module ProxyList
  class Manager
    attr_reader :proxies

    def initialize(default_proxies=[], source=Source.new, validator=Validator.new)
      @source     = source
      @validator  = validator
      @proxies    = default_proxies
    end

    # fetch proxy from sources
    def fetch
      @proxies = @source.list.uniq
    end

    # validate proxies from sources, only keep valid proxies
    def validate(timeout=3)
      @proxies = @validator.validate_proxies(@proxies, timeout)
    end

    # Return first proxy from list, then rotate the proxy list.
    # Return nil if proxy servers list is empty.
    def proxy
      if @proxies.length > 0
        proxy = @proxies.first
        rotate_list
        proxy
      else
        nil
      end
    end

    # Return a random proxy from the list.
    # Return nil if proxy servers list is empty.
    def random_proxy
      if @proxies.length > 0
        @proxies[rand(@proxies.size)]
      else
        nil
      end
    end

    # delete a proxy from list
    # if parametyer validate is true, it will validate the proxy before delete, and only delete if it is invalid
    # otherwise, simply delete a proxy from list
    def delete(proxy, validate: false)
      if !validate || !@validator.validate(proxy)
        @proxies.delete(proxy)
      end      
    end

    private 

    # rotate the list of proxy. i.e. move the first proxies item to last.
    def rotate_list
      @proxies.push @proxies.shift
    end
  end
end