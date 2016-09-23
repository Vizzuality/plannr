class CreateRosters < ActiveRecord::Migration[5.0]
  def change
    create_table :rosters do |t|
      t.integer :team_id
      t.integer :user_id
      t.decimal :percentage

      t.timestamps
    end
  end
end
