class RemoveChildrenFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :children, :string
  end
end
