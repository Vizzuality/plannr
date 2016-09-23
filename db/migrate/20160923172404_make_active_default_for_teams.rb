class MakeActiveDefaultForTeams < ActiveRecord::Migration[5.0]
  def change
    change_column :teams, :active, :boolean, default: true
  end
end
