class Blog < ActiveRecord::Base

	extend FriendlyId
	friendly_id :title,use: :slugged
	
	scope :published, -> { where(draft: 0) }
	scope :draft, -> { where(draft: 1) }
	
	#relationships
	has_many :blog_images


	#many-to-many relationship with tag
	has_many :blog_tag_relationships
	has_many :tags, through: :blog_tag_relationships,source: :tag

 	attr_writer :tags_string
 	attr_accessor :tags_string
	after_save :assign_tags


	private
	def assign_tags
	 if @tags_string
	      self.tags = @tags_string.split(',').map do |name|
	        Tag.find_or_create_by(name: name)
	      end
	    end
	end

	
	def self.get_years

		years_hash={}
		years = []
		
		beginning_of_time = Blog.first.created_at.year
		end_of_time = Blog.last.created_at.year
		
		year = beginning_of_time
		while year <=end_of_time
			years<<year
			year+=1
		end
		
		years.each do |year|
			blogs = Blog.by_year(year)
			years_hash[year]=blogs.reverse()
		end
		years_hash
	end

end
