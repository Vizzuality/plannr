class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :project_id
      t.date :planned_date
      t.string :name
      t.date :date_sent
      t.decimal :value

      t.timestamps null: false
    end
  end
end
