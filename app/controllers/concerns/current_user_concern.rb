module CurrentUserConcern
    extend ActiveSupport::Concern 
  
  def current_user
    super || OpenStruct.new(name: "Guest User", first_name: "Guest User", email: "asfg@uewk.com")
  end
end