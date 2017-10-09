module PageContentConcern
  extend ActiveSupport::Concern 
  included do
    before_action :set_content
  end
  
  def set_content
    @page_title = "Siyu An | My Website"
    @seo_keywords = "Siyu An's Personal Website"	
  end
end