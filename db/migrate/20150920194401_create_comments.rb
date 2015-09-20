class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.integer :user_id, null: false, index: true
      t.integer :post_id, null: false
      t.integer :parent_comment_id

      t.timestamps null: false
    end
  end
end
