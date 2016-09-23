class RenameProjectManagersToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_table :project_managers, :users
  end
end
