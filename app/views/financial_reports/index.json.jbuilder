json.array!(@financial_reports) do |financial_report|
  json.extract! financial_report, :id
  json.url financial_report_url(financial_report, format: :json)
end
