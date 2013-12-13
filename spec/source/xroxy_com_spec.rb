require 'proxy_list/source/xroxy_com'

describe ProxyList::Source::XroxyCom do
  subject { ProxyList::Source::XroxyCom.new }

  context "#list" do
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