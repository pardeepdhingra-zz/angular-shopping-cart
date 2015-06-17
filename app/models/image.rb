class Image < ActiveRecord::Base
  mount_uploader :photo, ImageUploader
  belongs_to :imageable, polymorphic: true
  validate :only_one_main, if: :main_image?
  scope :main_images, ->(type, id) { where(:imageable_id => id, :imageable_type=>type, :main=>true)}

  def main_image?
  	main 
  end

  def only_one_main
	  matches = Image.main_images(self.imageable_type, self.imageable_id)
	  if persisted?
	    matches = matches.where('id != ?', id)
	  end
	  if matches.exists?
	    errors.add(:active, 'cannot have another main image.')
	  end
	end
end