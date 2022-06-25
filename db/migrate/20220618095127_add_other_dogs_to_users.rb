class AddOtherDogsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :other_dogs, :boolean
  end
end
