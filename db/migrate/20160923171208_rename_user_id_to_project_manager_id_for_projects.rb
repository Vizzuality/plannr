class RenameUserIdToProjectManagerIdForProjects < ActiveRecord::Migration[5.0]
  def change
    rename_column :projects, :user_id, :project_manager_id
  end
end
