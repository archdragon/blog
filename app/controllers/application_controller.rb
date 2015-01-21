class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

protected

  def set_page_title(title)
    @page_title = title
  end

  def set_page_description(description)
    @page_description = description
  end

  def set_page_keywords(keywords)
    @page_keywords = keywords
  end

end
