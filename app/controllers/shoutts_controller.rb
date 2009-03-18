class ShouttsController < ApplicationController
  
  before_filter :login_required
  
  def index
    @shoutts = paginate_latests_shoutts
    respond_to do |format|
      format.html
      format.atom
    end
  end
  
  def new
    @shoutts = paginate_latests_shoutts
    render :partial => 'shoutts_container'
  end
  
  def to_me
    @shoutts = paginate_latests_shoutts(:conditions => "body LIKE '%#{current_user.login}%'")
    render :json => @shoutts.to_json
  end

  def create
    @shoutt = Shoutt.new(params[:shoutt].merge(:date => Time.now, :user => current_user))
    flash[:notice] = I18n.t(:'shoutt.save.success') if @shoutt.save
	render :nothing => true
  end
  
  private
  
  def paginate_latests_shoutts(map = {})
    paginate_latests(:shoutts, map.merge!(:per_page => Configuration.shoutts_x_page))
  end

end
