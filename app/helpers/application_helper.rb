module ApplicationHelper
	def login_condition_helper
		if current_user.is_a?(User)
			link_to "Logout", destroy_user_session_path, method: :delete
		else
			(link_to "SignUp", new_user_registration_path, method: :get) +
			"<br>".html_safe +
			(link_to "Login", new_user_session_path, method: :get)
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
end
