module PageContentConcern
  extend ActiveSupport::Concern 
  included do
    before_action :set_content
  end
  
  def set_content
    @page_title = "My Personal Website | Siyu An"
    @seo_keywords = "Siyu An's Personal Website"	
  end
end