module ApplicationHelper
  def page_title
    @page_title ? @page_title + " - " + Rails.application.config.default_page_title : Rails.application.config.default_page_title
  end

  def page_keywords
    @page_keywords || Rails.application.config.default_page_keywords
  end

  def page_description
    @page_description || Rails.application.config.default_page_description
  end

end
