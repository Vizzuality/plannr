class AddProjectNameToProjectReports < ActiveRecord::Migration[5.0]
  def change
    add_column :project_reports, :project_name, :string
  end
end
