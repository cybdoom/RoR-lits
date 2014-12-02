class ErrorsController < ApplicationController

  def not_found
    parse_page_meta_info "404"
    render :status => 404
  end

end
