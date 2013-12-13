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
end