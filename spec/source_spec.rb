require 'proxy_list/source'

describe ProxyList::Source do
  subject { ProxyList::Source.new }

  context "#list" do
    it "should find proxy via sources" do
      # prepare fake source list
      source1 = double(:source)
      allow(source1).to receive(:list).and_return(["22.22.22.1:8080", "22.22.22.2:8080"])
      source2 = double(:source)
      allow(source2).to receive(:list).and_return(["33.22.22.2:8080"])

      # the Source should use sources to fetch result
      proxies = subject.list([source1, source2])
      proxies.should_not be_nil
      proxies.size.should == 3
      proxies.first.should == "22.22.22.1:8080"
    end
  end
end