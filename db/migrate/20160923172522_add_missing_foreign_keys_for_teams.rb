class AddMissingForeignKeysForTeams < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key "teams", "users", column: "project_manager_id"
    add_foreign_key "teams", "users", column: "tech_lead_id"
  end
end
