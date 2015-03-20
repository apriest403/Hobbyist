class AddDescriptionToHobby < ActiveRecord::Migration
  def change
    add_column :hobbies, :description, :text
  end
end
