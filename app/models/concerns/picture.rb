module Picture
  extend ActiveSupport::Concern

  def self.generate_image(height:, width:)
    "http://via.placeholder.com/#{height}x#{width}"
  end
end