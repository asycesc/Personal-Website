module CurrentUserConcern
		extend ActiveSupport::Concern 
	
	def current_user
		super || guest_user
	end

	def guest_user
		guest = GuestUser.new
		guest.name = "GuestUser"
		guest.first_name = "Guest User"
		guest.last_name = "User"
		guest.email = "notexist@guest.com"
		guest
	end
end