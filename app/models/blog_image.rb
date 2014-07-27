class BlogImage < ActiveRecord::Base
	mount_uploader :image, BlogImageUploader 
	belongs_to :blog
end
