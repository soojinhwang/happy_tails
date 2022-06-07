class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :age, :integer
    add_column :users, :shelter, :boolean
    add_column :users, :biography, :text
    add_column :users, :type_of_dwelling, :string
    add_column :users, :outdoor_space, :boolean
    add_column :users, :other_pets, :string
    add_column :users, :children, :string
    add_column :users, :hours_alone, :integer
    add_column :users, :previous_experience, :text

  end
end
