class HomeController < ApplicationController

  def index
    @services = Service.where("display_mode != ''").limit(3).order("updated_at")
    parse_page_meta_info "home"
  end

  def about
    parse_page_meta_info "about"
  end

  def process_contacts
    SupportMailer.contacts_email( params[:name], params[:email], params[:phone], params[:message]).deliver
    render :text => :success
  end
end
