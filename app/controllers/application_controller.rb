class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper

  def index

  end

  def contact
    render partial: 'vacancies/contact', locals: { contact: contact_params }
  end

  private

  def contact_params
    params.require(:contact).permit(:type, :value)
  end

end
