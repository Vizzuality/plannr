class RenameUserIdToProjectManagerIdInTeams < ActiveRecord::Migration[5.0]
  def change
    rename_column :teams, :user_id, :project_manager_id
  end
end
