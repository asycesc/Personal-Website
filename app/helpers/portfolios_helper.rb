module PortfoliosHelper
	def generate_image (height:, width:)
		"http://via.placeholder.com/#{height}x#{width}"
	end

	def portfolio_image img, type
		if img.model.main_image? || img.model.thumb_image?
			img
		elsif type == 'thumb_image'
			generate_image(height: '350', width: '200')
		elsif type == 'main_image'
			generate_image(height: '600', width: '400')
		end
	end
end