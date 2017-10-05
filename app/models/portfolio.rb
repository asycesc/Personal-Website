class Portfolio < ApplicationRecord
  
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    where(subtitle: "Angular")
  end

  scope :ruby_on_rails, -> {where(subtitle: "Ruby On Rails")}

  include Picture
  after_initialize :set_default
  def set_default
    self.main_image ||= Picture.generate_image(height: 600, width:400)
    self.thumb_image ||= Picture.generate_image(height: 350, width:200)
  end

  has_many :technologies

  accepts_nested_attributes_for :technologies, reject_if: lambda { |attrs| attrs['name'].blank?}
end
