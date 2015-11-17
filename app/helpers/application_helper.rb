module ApplicationHelper
  include HtmlBuilder

  def document_title
    if @title.present?
      "#{@title} - #{application_setting.application_name}"
    else
      application_setting.application_name
    end
  end
end
