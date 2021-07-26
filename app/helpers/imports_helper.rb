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

  def import_template_link
    link_to '/spreadsheets_models/example_template_bulk_user.xlsx', class: 'btn btn-primary' do 
      content_tag(:i, ' Download', class: 'far fa-file-excel')
    end
  end
end