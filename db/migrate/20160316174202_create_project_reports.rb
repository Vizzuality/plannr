class CreateProjectReports < ActiveRecord::Migration[5.0]
  def change
    create_table :project_reports do |t|
      t.integer :project_id
      t.integer :report_id
      t.float :total_time, default: 0.0
      t.json :breakdown, default: "{}"

      t.timestamps
    end
  end
end
