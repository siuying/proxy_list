require 'proxy_list/source/cz88'

describe ProxyList::Source::Cz88 do
  subject { ProxyList::Source::Cz88.new }

  context "#list" do
    it "should find proxy list" do
      proxies = subject.list(urls: ["http://www.cz88.net/proxy/index.aspx", "http://www.cz88.net/proxy/http_2.aspx"])
      proxies.should_not be_nil
      proxies.size.should >= 50
    end
  end
end