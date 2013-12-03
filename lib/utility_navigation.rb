  class UtilityNavigation < ActiveAdmin::Component
    def build(admin)
      text_node render('shared/utility_navigation')
    end  
  end