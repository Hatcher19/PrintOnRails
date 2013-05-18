module OrdersHelper
	def priority_tag_for_order(order)
		order_priority(admin.order) 
		color_for_weight(admin.order.priority)
	end
	def color_for_weight(weight)
		case weight
			when 'low'
				:blue
			when 'normal'
				:none
			when 'high'
				:orange
			when 'immediate'
				:red
		end
	end
end