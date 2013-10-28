class ActiveAdmin::Views::Pages::Base < Arbre::HTML::Document
	private
  def build_footer # Renders the content for the footer
    div :id => "footer" do
      para "Copyright &copy; #{Date.today.year.to_s} #{link_to('PrintOnRails.com', 'http://printonrails.com')}.<br> Founded & Developed by Daniel Hatcher".html_safe
    end
  end
end