Factory.define :configuration do |c|
  c.shoutts_x_page 30
  c.authenticate_by_ldap false
  c.ldap_host "ad.host.com"
  c.ldap_base "DC=dc,dc=DC"
  c.ldap_login_suffix "@myhost.com"
  c.ldap_search_key "samAccount"
end

Factory.define :user do |u|
  password = 'whydoyouwannakillme'
  u.login 'batman'
  u.email 'batman@dccomics.com'
  u.name 'Batman'
  u.password password
  u.password_confirmation password
end

Factory.define :shoutt do |s|
  s.body 'why so serious?'
  s.date Time.now
end
