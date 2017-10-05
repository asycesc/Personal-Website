class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include WhiteListConcern

  include SetSourceConcern
  
  include CurrentUserConcern

end
