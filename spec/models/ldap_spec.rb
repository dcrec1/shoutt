require File.dirname(__FILE__) + '/../spec_helper'

describe LDAP do

  before :each do
    load_config
  end
  
  it "shoud init with host and base from configuration" do
    host, base = Configuration.ldap_host, Configuration.ldap_base
    MyLDAP.should_receive(:new).with(host, base)
    LDAP.init
  end
  
  context "after initialization" do
  
    before :each do
      @my_ldap = mock(MyLDAP)
      MyLDAP.stub!(:new).and_return(@my_ldap)
      LDAP.init
    end
  
    it "should authenticate by MyLDAP" do
      user, password = "user", "password"
      @my_ldap.should_receive('authenticates?').with(user + Configuration.ldap_login_suffix, password)      
      LDAP.authenticates?(user, password)
    end
    
    it "should find an user by a configured key" do
      login, result = "login", [4,5,6,5]
      @my_ldap.stub!(:find).with(Configuration.ldap_search_key, login).and_return(result)
      LDAP.find(login).should eql(result.first)
    end
  
  end

end
