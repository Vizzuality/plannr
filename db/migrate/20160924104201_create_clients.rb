class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :url
      t.string :short_name

      t.timestamps
    end
  end
end
