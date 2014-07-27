class CreateBlogImage < ActiveRecord::Migration
  def change
    create_table :blog_images do |t|
      t.string :image
      t.integer :blog_id
    end
  end
end
