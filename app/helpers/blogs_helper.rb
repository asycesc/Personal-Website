module BlogsHelper
	def gravatar user
		image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 60
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

	def blog_status_color blog
		if blog.draft?
			'color: red;'
		end
	end
end
