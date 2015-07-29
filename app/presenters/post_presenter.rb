class PostPresenter < SimpleDelegator
  def formatted_text
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

  def human_attribute_name(*args)
    __getobj__
  end
end
