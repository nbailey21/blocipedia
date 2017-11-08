module ApplicationHelper
    def form_group_tag(errors, &block)
        css_class = 'form-group'
        css_class << ' has error' if errors.any?
        content_tag :div, capture(&block), class: css_class
    end

    def markdown(text)
    options = {
      filter_html:     false,
      hard_wrap:       false,
    }

    extensions = {
      autolink:           true,
      superscript:        true,
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
