class TagsController < ApplicationController
	def create_tags
		Tag.create_tags(params[:tags_string])
	end
end