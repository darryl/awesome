json.array!(@samples) do |sample|
  json.extract! sample, 
  json.url sample_url(sample, format: :json)
end