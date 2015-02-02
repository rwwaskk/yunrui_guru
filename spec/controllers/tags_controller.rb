require "rails_helper"

describe TagsController, :type => :controller do
   describe "get #show" do
   	it "should render the show template" do
   		Blog.create!(title:"T",content:"T",tags_string:"ruby")
   		get :show,:name=>'ruby'
   	        expect(response).to render_template("show")
   	end

   	it "should make the tag variable available in the view template" do
   		Blog.create!(title:"T",content:"T",tags_string:"ruby")
   		get :show,:name=>'ruby'
      		expect(assigns(:tag)).to match(Tag.find_by_name("ruby"))
   	end
   	it "should make the blogs with the tag available in the view template" do
   		Blog.create!(title:"T",content:"T",tags_string:"ruby")
   		Blog.create!(title:"T1",content:"T1",tags_string:"ruby,rails")

   		get :show,:name=>'ruby'
      		expect(assigns(:blogs)).to match_array(Blog.all)
      		
   	end
  end
end