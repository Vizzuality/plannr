class RemoveManagesProjectsAndAddRoleToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :manages_projects, :booleam
    add_column :users, :role, :string, default: nil
  end
end
