require "rails_helper"

describe Blog, :type => :model do
   it "create multiple blog tags and blog tag relationships relationships using callback" do
   	Blog.create!(:title=>'Hello World',:content=>"Hello World Rspec",:tags_string=>"ruby,rails,tdd,rspec")
	Blog.find_by_title("Hello World").tags.size.should==4
  end
end