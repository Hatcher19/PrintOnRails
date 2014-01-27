module ActivityHelper
	
  ORDER_STATUS = ["new", "approved", "complete", "hold", "cancelled"]
  ART_STATUS = ['in_progress', 'complete']
  PRODUCT_STATUS = ['purchased', 'purchased', 'partial','complete']

  def self.changeset_string(changeset)
    activity_type = changeset.keys[0]
    new_value = changeset[activity_type][1]
    "#{activity_type_display_name(activity_type)} has been changed to #{activity_name(activity_type, new_value.to_i)}"
  end

  def self.activity_type_display_name(activity_type)

    case activity_type
    when "name"
      "name"
    when "order_status_id"
      "Order Status"
    when "art_status_id"
      "Art Status"
    when "product_status_id"
      "Product Status"
    else
      puts "No activity_type found"
    end

  end
  
  def self.activity_name(activity_type, index)
    index = index - 1

    case activity_type
    when "order_status_id"
      ORDER_STATUS[index]
    when "art_status_id"
      ART_STATUS[index]
    when "product_status_id"
      PRODUCT_STATUS[index]
    else
      puts "No activity_type found"
    end
    
  end

end