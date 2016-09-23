class RenameProjectManagerIdToUserIdInProjects < ActiveRecord::Migration[5.0]
  def change
    rename_column :projects, :project_manager_id, :user_id
  end
end
