class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.integer :project_id
      t.integer :milestone
      t.date :release_date
      t.string :name

      t.timestamps null: false
    end
  end
end
