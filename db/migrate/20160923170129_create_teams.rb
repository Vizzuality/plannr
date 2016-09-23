class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :user_id
      t.boolean :active

      t.timestamps
    end
  end
end
