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

	def session_source_helper style
		if session[:source]
			content_tag(:div, "Thanks for visiting from my #{session[:source]}", class: style)
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
				url: news_path,
				title: 'News'
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

	def alerts
		alert = (flash[:alert] || flash[:error] || flash[:notice])

		if alert
			alert_generator alert
		end
	end

	def markdown text
		coderayified = CodeRayify.new(filter_html: true, hard_warp: true)
		extensions = {
			fenced_code_blocks: true,
			no_intra_emphasis: true,
			auto_links: true,
			lax_html_blocks: true
		}
		markdown_html = Redcarpet::Markdown.new(coderayified, extensions)
		markdown_html.render(text).html_safe
	end

	class CodeRayify < Redcarpet::Render::HTML
		def block_code(code, language)
			CodeRay.scan(code, language).div
		end
	end

	def alert_generator msg
		js add_gritter(msg,  sticky: false)
	end
end
