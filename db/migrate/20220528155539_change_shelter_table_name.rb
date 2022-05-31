class ChangeShelterTableName < ActiveRecord::Migration[6.1]
  def change
    rename_table :shelter_infos, :shelters
  end
end
