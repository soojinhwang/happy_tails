class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :adoption_status
      t.string :name
      t.string :species
      t.string :breed
      t.string :sex
      t.string :age
      t.string :colour
      t.text :description
      t.boolean :outdoor_space
      t.string :pet_friendly
      t.string :children_friendly
      t.integer :hours_alone
      t.text :medical_conditions
      t.references :shelter_info, null: false, foreign_key: true

      t.timestamps
    end
  end
end
