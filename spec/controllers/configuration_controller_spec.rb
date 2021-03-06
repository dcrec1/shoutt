require File.dirname(__FILE__) + '/../spec_helper'

describe ConfigurationController do

  context "on index" do
  
    it "should return the first configuration" do
      Configuration.stub!(:first).and_return(config)
      get :index
      assigns[:configuration].should eql(config)
    end
    
    it "should return a new configuration if non exist" do
      Configuration.stub!(:first)
      Configuration.stub!('create!').and_return(config)
      get :index
      assigns[:configuration].should eql(config)
    end
  
  end
  
  context "on update" do
  
    before :each do
      Configuration.stub!(:first).and_return(config)
      config.stub!(:save).and_return(false)
      @params = {'this' => 'params'}
    end
    
    context "when a configuration  already exists" do
      
      it "should update configuration attributes if it exist" do
        Configuration.stub!(:first).and_return(config)
        config.should_receive(:update_attributes).with(@params)
        put :update, :id => 1, :configuration => @params
      end
    
    end
    
    context "when a configuration doesnt exists" do
    
      it "should create a new configuration if non exist" do
        Configuration.stub!(:first).and_return(nil)
        Configuration.should_receive(:new).with(@params).and_return(config)
        put :update, :id => 1, :configuration => @params
      end
    
    end
    
    it "should flash a i18n message when success" do
      config.stub!(:save).and_return(true)
      msg = "fswgfsd"
      I18n.stub!(:t).with(:'configuration.save.success').and_return(msg)
      put :update, :id => 1
      flash[:notice].should eql(msg)
    end
    
    it "should render index" do
      put :update, :id => 1
      response.should render_template("configuration/index")
    end
    
    it "should assign a configuration instance" do
      put :update, :id => 1
      assigns[:configuration].should eql(config)
    end
  
  end

end
