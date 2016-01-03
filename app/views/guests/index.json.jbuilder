json.array!(@guests) do |guest|
  json.extract! guest, :id, :ip
  json.url guest_url(guest, format: :json)
end
