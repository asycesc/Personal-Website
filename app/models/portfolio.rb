class Portfolio < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: :slugged
	
	validates_presence_of :title, :body

	mount_uploader :main_image, PortfolioUploader
	mount_uploader :thumb_image, PortfolioUploader

	def self.angular
		where(subtitle: "Angular")
	end

	scope :ruby_on_rails, -> {where(subtitle: "Ruby On Rails")}

	has_many :technologies

	accepts_nested_attributes_for :technologies, reject_if: lambda { |attrs| attrs['name'].blank?}

	def self.by_position
		order("position ASC")
	end
end
