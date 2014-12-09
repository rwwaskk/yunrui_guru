class AddDraftToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :draft, :integer
  end
end
