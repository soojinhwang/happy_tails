class RemoveChildrenFriendlyFromPets < ActiveRecord::Migration[6.1]
  def change
    remove_column :pets, :children_friendly, :string
  end
end
