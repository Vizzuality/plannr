class AddForeignKeysForRoster < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key "rosters", "users", column: "user_id"
    add_foreign_key "rosters", "teams", column: "team_id"
  end
end
