class CreateConfiguration < ActiveRecord::Migration
  def self.up
	create_table "configurations", :force => true do |t|
      t.integer :shoutts_x_page, :default => 20
	  t.boolean :authenticate_by_ldap, :default => false
	  t.string :ldap_host, :null => false, :default => ''
	  t.string :ldap_base, :null => false, :default => ''
	  t.string :ldap_login_suffix, :null => false, :default => ''
	  t.string :ldap_search_key, :null => false, :default => ''
	  
	  t.timestamps
    end
  end

  def self.down
  end
end
