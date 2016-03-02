class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :budget
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
