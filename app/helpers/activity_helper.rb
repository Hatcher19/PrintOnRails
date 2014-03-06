module ActivityHelper
	
  ORDER_STATUS = ["new", "approved", "complete", "hold", "cancelled"]
  ART_STATUS = ['pending', 'approved', 'rejected']
  PRODUCT_STATUS = ['purchased', 'purchased', 'partial','complete'] 

  def self.changeset_string(changeset)
    activity_type = changeset.keys[0]
    new_value = changeset[activity_type][1]
    "#{activity_type_display_name(activity_type)} has been changed to #{activity_name(activity_type, new_value.to_i)}"
  end

  def self.activity_type_display_name(activity_type)

    case activity_type
    when "name"
      "Order"
    when "end_date"
      "Due Date"
    when "order_category_id"
      "Category"
    when "order_status"
      "Status"
    when "art_status"
      "Art Status"
    when "product_status"
      "Product Status"
    else
      puts "No activity_type found"
    end

  end
  
  def self.activity_name(activity_type, index)
    index = index - 1

    case activity_type
    when "name"
      "Created"
    when "order_status"
      ORDER_STATUS[index]
    when "art_status"
      ART_STATUS[index]
    when "product_status"
      PRODUCT_STATUS[index]
    else
      puts "No activity_type found"
    end
    
  end
end