json.array!(@libraries) do |library|
  json.extract! library, 
  json.url library_url(library, format: :json)
end