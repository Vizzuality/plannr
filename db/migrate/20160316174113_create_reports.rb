class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.date :report_date

      t.timestamps
    end
  end
end
