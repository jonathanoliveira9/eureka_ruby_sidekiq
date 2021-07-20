module ImportsHelper
  def color_status(status)
    case status
    when 'success'
      content_tag(:span, status.titleize, class: 'badge rounded-pill bg-success')
    when 'in_progress'
      content_tag(:span, status.titleize, class: 'badge rounded-pill bg-primary')
    when 'fail'
      content_tag(:span, status.titleize, class: 'badge rounded-pill bg-danger')
    end
  end
end