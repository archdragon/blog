module ApplicationHelper
  def markdown(text)
    options = {
      filter_html:     false,
      hard_wrap:       true, 
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true, 
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      tables: true
    }

    renderer = Rouge::Renderer::HTML5.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    html_text = markdown.render(text).html_safe
  end

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