# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'spec/autorun'
require 'spec/rails'

require "factory_girl"

Spec::Runner.configure do |config|
  # If you're not using ActiveRecord you should remove these
  # lines, delete config/database.yml and disable :active_record
  # in your config/boot.rb
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'
end

def load_config
  Configuration.stub!(:find).and_return(config)
end

def config
  $config ||= Factory.build(:configuration)
end

def ldap_user
  entry = Net::LDAP::Entry.new
  entry.mail = ["my@email.com"]
  entry.givenname = ["Mister Email"]
  entry
end

def user
  $user ||= Factory(:user)
end

def shoutt
  $shout ||= Factory.build(:shoutt)
end

def login
  controller.stub!(:logged_in?).and_return(true)
  controller.stub!(:current_user).and_return(user)
end

def logout
  controller.stub!('logged_in?').and_return(false)
end

#TODO MOCK THIS
def load_shoutts
  100.times do |n|
    Factory(:shoutt, :body => "Shoutt @#{user.login}", :user => User.first)
  end
end
