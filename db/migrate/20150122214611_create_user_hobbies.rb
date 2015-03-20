class CreateUserHobbies < ActiveRecord::Migration
  def change
    create_table :user_hobbies do |t|
      t.integer :user_id
      t.integer :hobby_id

      t.timestamps null: false
    end
  end
end
