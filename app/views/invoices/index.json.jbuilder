json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :project_id, :planned_date, :name, :date_sent
  json.url invoice_url(invoice, format: :json)
end
