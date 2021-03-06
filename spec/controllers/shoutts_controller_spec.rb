require File.dirname(__FILE__) + '/../spec_helper'

describe ShouttsController do

  before :all do
    load_shoutts
  end
  
  before :each do
    login
	  load_config
  end

  it "should create a shoutt when user is loggged" do
    post :create, :shoutt => { :body => shoutt.body }
    Shoutt.find(:last).body.should eql(shoutt.body)
  end
  
  it "should notice that shoutt was successful created when done so" do
    msg = "sgsdgsdgsd"
    I18n.stub!(:t).with(:'shoutt.save.success').and_return(msg)
    post :create, :shoutt => { :body => shoutt.body }
    flash[:notice].should eql(msg)
  end
  
  it "should advice that user is not logged when tried to shoutt" do
    logout
    post :create, :shoutt => { :body => "whatever"}
    response.should redirect_to('session/new')
  end
  
  it "should index shoutts when user is logged" do
    get :index
    assigns[:shoutts].size.should eql(config.shoutts_x_page)
  end
  
  it "should route to index on shoutts" do
    route_for(:controller => "shoutts", :action => "index").should == "/shoutts"
  end
  
  it "should paginate shoutts" do
    shoutts_x_page = 10
    Configuration.stub!(:shoutts_x_page).and_return(shoutts_x_page)
    get :index, { :page => 2 }
    expected_shoutt = Shoutt.find(:all, :limit => 1, :offset => shoutts_x_page, :order => "id DESC").first
    assigns[:shoutts].first.should eql(expected_shoutt)
  end
  
  it "should index shoutts shoutted to me" do
    get :to_me
    assigns[:shoutts].last.body.should include(user.login) 
  end
  
  describe "'new' action" do
    
    it "should render shoutts container" do
      controller.should_receive(:render).with(:partial => 'shoutts_container')
      get :new
    end
    
    it "should return latests shoutts" do
      get :new
      assigns[:shoutts].size.should eql(config.shoutts_x_page)
    end
  
  end

end
