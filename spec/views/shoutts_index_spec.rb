require File.dirname(__FILE__) + '/../spec_helper'

def shoutts_index
  "shoutts/index"
end

describe shoutts_index do
  
  before :all do
    load_shoutts
    @shoutts = Shoutt.paginate(:page => 1, :order => "id DESC")
  end
  
  before :each do
    assigns[:shoutts] = @shoutts
  end
  
  it "should display shoutts" do
    render shoutts_index
    response.should have_tag(".shoutt")
  end
  
  it "should have latest shoutt id" do
    render shoutts_index
    latest_shoutt_id_should_equal assigns[:shoutts].first.id
  end
  
  it "should have latest shoutt id as 0 when none exists" do
    assigns[:shoutts] = Shoutt.paginate_by_id(0, :page => 1)
    render shoutts_index
    latest_shoutt_id_should_equal 0
  end
  
  it "should have a new shoutt textarea" do
    render shoutts_index
    response.should have_tag("textarea#shoutt_body")
  end
  
  it "should display the name who shoutted" do
    render shoutts_index
    response.should have_tag(".shoutt > .user", @shoutts.first.user.name)
  end
  
  def latest_shoutt_id_should_equal(x)
    response.should have_tag("#latest_shoutt_id[value=?]", x.to_s)
  end
  
end
