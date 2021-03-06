require File.dirname(__FILE__) + '/../spec_helper'

def configuration_index
  "configuration/index"
end

describe configuration_index do

  before :each do
	@config = config
	@config.id = 43
	@config.stub!('new_record?').and_return(false)
    assigns[:configuration] = @config
  end

  it "should have a creation form for config attributes" do
    render configuration_index
    response.should have_tag("form[action=?][method=post]", configuration_path(@config)) do
      with_tag("input#configuration_shoutts_x_page[name=?]", "configuration[shoutts_x_page]")
      with_tag("input#configuration_authenticate_by_ldap[name=?]", "configuration[authenticate_by_ldap]")
      with_tag("input#configuration_ldap_host[name=?]", "configuration[ldap_host]")
      with_tag("input#configuration_ldap_base[name=?]", "configuration[ldap_base]")
      with_tag("input#configuration_ldap_login_suffix[name=?]", "configuration[ldap_login_suffix]")
      with_tag("input#configuration_ldap_search_key[name=?]", "configuration[ldap_search_key]")
    end
  end


end
