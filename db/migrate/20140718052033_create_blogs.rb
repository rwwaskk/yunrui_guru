class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.timestamps
    end
    add_index :blogs, :slug, unique: true
  end
end
