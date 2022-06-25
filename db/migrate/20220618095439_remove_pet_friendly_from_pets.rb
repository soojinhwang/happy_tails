class RemovePetFriendlyFromPets < ActiveRecord::Migration[6.1]
  def change
    remove_column :pets, :pet_friendly, :string
  end
end
