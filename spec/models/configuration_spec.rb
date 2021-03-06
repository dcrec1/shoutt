require File.dirname(__FILE__) + '/../spec_helper'

describe Configuration do

  before :each do
    load_config
  end
  
  it "should return shoutts x page count" do
    Configuration.shoutts_x_page.should eql(config.shoutts_x_page)
  end
  
  context "should return if ldap authentication is" do
  
    it "active" do
      my_config = mock(Configuration)
      my_config.stub!(:authenticate_by_ldap).and_return(true)
      Configuration.stub!(:config).and_return(my_config)
      Configuration.authenticate_by_ldap?.should be_true
    end
    
    it "inactive" do
      Configuration.authenticate_by_ldap?.should be_false
    end
  
  end
  
  it "should return ldap server host" do
    Configuration.ldap_host.should eql(config.ldap_host)
  end
  
  it "should return ldap server base" do
    Configuration.ldap_base.should eql(config.ldap_base)
  end
  
  it "should return ldap login suffix" do
    Configuration.ldap_login_suffix.should eql(config.ldap_login_suffix)
  end
  
end
