class Tag < ActiveRecord::Base

	has_many :blog_tag_relationships
	has_many :blogs, through: :blog_tag_relationships
	
	
end

