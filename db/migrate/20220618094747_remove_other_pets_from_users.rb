class RemoveOtherPetsFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :other_pets, :string
  end
end
