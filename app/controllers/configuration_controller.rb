class ConfigurationController < ApplicationController

  def index
    @configuration = Configuration.first || Configuration.create!
  end

  def update
    @configuration = Configuration.first
    if @configuration.nil?
      @configuration = Configuration.new(params[:configuration])
    else
      @configuration.update_attributes(params[:configuration])
    end
    flash[:notice] = I18n.t(:'configuration.save.success') if @configuration.save
    render "index"
  end

end
