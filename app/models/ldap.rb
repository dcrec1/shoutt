class LDAP

  def self.init
    @ldap = MyLDAP.new(Configuration.ldap_host, Configuration.ldap_base)
  end
  
  def self.authenticates?(user, password)
    @ldap || init
    @ldap.authenticates?(user + Configuration.ldap_login_suffix, password)
  end
  
  def self.find(value)
    @ldap.find(Configuration.ldap_search_key, value).first
  end
  
end
