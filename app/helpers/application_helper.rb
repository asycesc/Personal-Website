module ApplicationHelper
	def login_condition_helper(style = "")
		if current_user.is_a?(GuestUser)
			(link_to "Signup", new_user_registration_path, method: :get, class: style) +
			" ".html_safe +
			(link_to "Login", new_user_session_path, method: :get, class: style)
		else
			link_to "Logout", destroy_user_session_path, method: :delete, class: style
		end
	end

	def session_source_helper
		if session[:source]
			content_tag(:p, "Thanks for visiting from my #{session[:source]}")
		end
	end
	
	def set_copyright_helper
		SiyView::Renderer.copyright "Siyu An", "All rights reserved"
	end

	def navigator_items 
		[
			{
				url: root_path,
				title: 'Home'
			}, 
			{
				url: about_path,
				title: 'About'
			}, 
			{
				url: contact_path,
				title: 'Contact'
			}, 
			{
				url: blogs_path,
				title: 'Blogs'
			}, 
			{
				url: portfolios_path,
				title: 'Portfolios'
			}
		]
	end


	def navigator_helper style, tag
		navigator = ''
		navigator_items.each do |item|
			navigator << "<#{tag}> <a href='#{item[:url]}' class='#{style} #{active_helper? item[:url]}'>#{item[:title]}</a></#{tag}>"
		end
		navigator.html_safe	
	end

	def active_helper? path
		"active" if current_page? path
	end
end
