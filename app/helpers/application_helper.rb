module ApplicationHelper
  def current_user
    return nil unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def page_title(page_title, options={})
    content_for(:title, page_title.to_s)
    #content_tag(:h1, page_title, options)
  end

  def page_description(page_description, options={})
    content_for(:description, page_description.to_s)
    #content_tag(:h1, page_title, options)
  end

  def parse_page_meta_info page_name
    page = Page.find_last_by_name page_name
    if page
      @page_title = page.title
      @page_description = page.description
    end
  end

end
