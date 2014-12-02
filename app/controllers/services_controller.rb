class ServicesController < ApplicationController

  def index
    @services = Service.all.order("updated_at desc")
    parse_page_meta_info "services"
  end

end
