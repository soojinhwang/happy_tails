class AddDetailsToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :other_cats, :boolean
    add_column :pets, :other_dogs, :boolean
    add_column :pets, :children, :boolean
  end
end
