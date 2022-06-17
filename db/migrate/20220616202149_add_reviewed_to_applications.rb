class AddReviewedToApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :reviewed, :boolean
  end
end
