class CreateBlogTagRelationships < ActiveRecord::Migration
  def change
    create_table :blog_tag_relationships do |t|
      t.integer :blog_id
      t.integer :tag_id
    end
  end
end
