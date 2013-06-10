module OrdersHelper
	def priority_tag_for_order(order)
    printonrails_status_tag order_priority(order), color_for_weight(order.priority)
  end

  def color_for_weight(weight)
    case weight
    when 'lowest'
    	:grey
     when 'low'
      :blue
    when 'mid'
      :yellow
    when 'high'
      :orange
    when 'highest'
      :red
    end
  end
end