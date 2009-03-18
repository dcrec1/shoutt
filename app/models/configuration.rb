class Configuration < ActiveRecord::Base
  
  def self.shoutts_x_page
    config.nil? ? 20 : config.shoutts_x_page
  end
  
  def self.authenticate_by_ldap?
    config.nil? ? false : config.authenticate_by_ldap
  end
  
  def self.method_missing(method, *arg)
    begin
      super
    rescue
      config.send method
    end  
  end
  
  private
  
  def self.config
    @@first ||= Configuration.first
  end
  
end
