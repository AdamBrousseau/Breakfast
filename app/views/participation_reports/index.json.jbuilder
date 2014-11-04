json.array!(@participation_reports) do |participation_report|
  json.extract! participation_report, :id
  json.url participation_report_url(participation_report, format: :json)
end
