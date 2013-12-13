require 'proxy_list/manager'

describe ProxyList::Manager do
  context "#fetch" do
    it "should fetch using Source" do
      source = double(:source)
      expect(source).to receive(:list) { ['1', '2'] }

      manager = ProxyList::Manager.new([], source)
      manager.fetch.should == ['1', '2']
      manager.proxy.should == '1'
    end
  end

  context "#validate" do
    it "should validate using Validator#validate_proxies" do
      validator = double(:validator)
      source = double(:source)
      expect(validator).to receive(:validate_proxies) { [] }

      manager = ProxyList::Manager.new([], source, validator)
      manager.validate.should == []
    end
  end

  context "#proxy" do
    it "should return first proxy, then rotate it" do
      manager = ProxyList::Manager.new(["1", "2"])
      manager.proxy.should == "1"
      manager.proxies.should == ["2", "1"]
    end
  end
end