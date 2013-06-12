module OrdersHelper
	def priority_tag_for_order(order)
    printonrails_status_tag order_priority(order), color_for_weight(order.priority)
  end

  def color_for_weight(weight)
    case weight
      when 'high'
      	:red
      when 'medium'
        :orange
      when 'low'
        :green
    end
  end
end