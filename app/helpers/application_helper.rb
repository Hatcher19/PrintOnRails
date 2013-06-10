module ApplicationHelper
	def printonrails_status_tag(label, color)
    content_tag(:span, label, class: "status #{color}")
  end

end
