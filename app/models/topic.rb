class Topic < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: :slugged
	validates_presence_of :title

	has_many :blogs

	def self.having_blog
		includes(:blogs).where.not(blogs: {id: nil})
	end
end
