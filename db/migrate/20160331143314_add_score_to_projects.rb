class AddScoreToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :score, :integer
  end
end
