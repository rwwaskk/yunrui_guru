class Tag < ActiveRecord::Base

	has_many :create_blog_tag_relationship
	
	after_save :create_blog_tag_relationship
	def self.create_tags(tags_array)
		tags_array.each do |name| 
			Tag.create!(:name=>name)
		end
	end

	def create_blog_tag_relationship
		BlogTagRelationship.create!(:tag_id=>self.id,:blog_id=>1)
	end
end

