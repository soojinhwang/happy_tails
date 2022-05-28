class RemoveShelterInfoReference < ActiveRecord::Migration[6.1]
  def change
    remove_reference :pets, :shelter_info, index: true
  end
end
