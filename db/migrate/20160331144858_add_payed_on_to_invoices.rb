class AddPayedOnToInvoices < ActiveRecord::Migration[5.0]
  def change
    add_column :invoices, :payed_on, :date
  end
end
