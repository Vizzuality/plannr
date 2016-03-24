class AddForeignKeys < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :project_reports, :projects
    add_foreign_key :project_reports, :reports
    add_foreign_key :milestones, :projects
    add_foreign_key :invoices, :projects
    add_foreign_key :projects, :project_managers
  end
end
