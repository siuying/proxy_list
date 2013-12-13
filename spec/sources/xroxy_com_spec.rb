require 'proxy_list/sources/xroxy_com'
require 'pry'

describe ProxyList::Sources::XroxyCom do
  subject { Object.new.extend(ProxyList::Sources::XroxyCom) }

  context "#proxy" do
    it "should find proxy list" do
      proxies = subject.list(page_count: 1)
      proxies.should_not be_nil
      proxies.size.should >= 0
    end

    it "should find proxy list for more than one page" do
      proxies = subject.list(page_count: 2)
      proxies.should_not be_nil
      proxies.size.should >= 10
    end
  end
end