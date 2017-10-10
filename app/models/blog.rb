class Blog < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: :slugged
	enum status: {draft: 0, published: 1}

	belongs_to :topic
	has_many :comments, dependent: :destroy

	validates_presence_of :title, :body, :topic_id

	def self.recent
		order("created_at DESC")
	end
end
