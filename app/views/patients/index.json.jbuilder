json.array!(@patients) do |patient|
  json.extract! patient, :id, :mrn, :name
  json.url patient_url(patient, format: :json)
end
