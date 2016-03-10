class CreateProjectManagers < ActiveRecord::Migration
  def change
    create_table :project_managers do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
