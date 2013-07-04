json.array!(@mixes) do |mix|
  json.extract! mix, 
  json.url mix_url(mix, format: :json)
end