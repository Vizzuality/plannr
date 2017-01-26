class AddLiveToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :live, :boolean, default: false
  end
end
