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
end
