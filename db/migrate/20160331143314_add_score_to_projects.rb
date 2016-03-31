class AddScoreToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :score, :integer, default: 0
  end
end
