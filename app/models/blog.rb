class Blog < ActiveRecord::Base
	
	#relationships
	has_many :blog_images
	
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
