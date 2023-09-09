module ApplicationHelper
  def render_comments(comments)
    return unless comments.present?

    content_tag(:div, id: 'comments') do
      comments.each do |comment|
        content_tag(:p, class: 'commentD') do
          "#{content_tag(:strong, comment.author.name)}: #{comment.text}"
        end
      end.join.html_safe
    end
  end

  def render_field(form, attribute, placeholder, autofocus: false)
    content_tag(:div, class: 'field') do
      concat(form.label(attribute, class: 'v-hidden'))
      options = { autofocus:, autocomplete: attribute.to_s }
      concat(form.text_field(attribute, options.merge(class: 'input-field', placeholder:)))
    end
  end
end
