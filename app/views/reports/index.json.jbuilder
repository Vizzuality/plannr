json.array!(@reports) do |report|
  json.extract! report, :id, :report_date
  json.url report_url(report, format: :json)
end
