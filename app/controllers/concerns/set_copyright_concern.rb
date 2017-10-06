module SetCopyrightConcern
	extend ActiveSupport::Concern 
	
	included do
	before_action :set_copyright
	end
	
	def set_copyright
		@copyright = SiyView::Renderer.copyright "Siyu An", "All rights reserved"
	end
end