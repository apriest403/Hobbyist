class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :link
      t.string :content
      t.references :user, index: true
      t.references :hobby, index: true

      t.timestamps null: false
    end
    add_foreign_key :posts, :users
    add_foreign_key :posts, :hobbies
  end
end
