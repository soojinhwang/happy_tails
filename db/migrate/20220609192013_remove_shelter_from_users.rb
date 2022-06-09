class RemoveShelterFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :shelter, :boolean
  end
end
