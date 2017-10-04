class Skill < ApplicationRecord
  include Picture
    
  validates_presence_of :title, :percentage

  after_initialize :set_default
  def set_default
    self.badge ||= Picture.generate_image(height: 250, width:250)
   end
end
