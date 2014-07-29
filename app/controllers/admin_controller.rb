class AdminController < ApplicationController

  layout 'admin'

  before_action :authorize

  def index
  end

  protected

  def authorize
    redirect_to login_path unless current_user
  end
end
