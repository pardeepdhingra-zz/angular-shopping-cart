class Product < ActiveRecord::Base
	include Imageable
	extend FriendlyId
    friendly_id :title, use: :slugged
	#TODO#
	#has_many :categories
	#has_many :tags

	def main_image
		"http://localhost:3000/assets/" + self.slug + ".jpg"
	end
end