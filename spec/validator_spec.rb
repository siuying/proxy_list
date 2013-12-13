require 'proxy_list/validator'

describe ProxyList::Validator do
  context "#validate" do
    it "should validate proxy" do
      subject.validate("216.218.133.217:80").should be_true
    end

    it "should return error for invalid proxy" do
      subject.validate("127.0.0.1:50").should be_false
    end
  end

  context "#validate_proxies" do
    it "should validate list of proxy" do
      allow(subject).to receive(:validate).and_return(false, false, true)
      proxies = subject.validate_proxies(["1.1.1.1:1", "2.2.2.2:2", "3.3.3.3:3"])
      proxies.size.should == 1
      proxies[0].should == "3.3.3.3:3"
    end
  end
end