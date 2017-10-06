module ApplicationHelper
	def login_condition
		if current_user.is_a?(User)
			link_to "Logout", destroy_user_session_path, method: :delete
		else
			(link_to "SignUp", new_user_registration_path, method: :get) +
			"<br>".html_safe +
			(link_to "Login", new_user_session_path, method: :get)
		end
	end
end
