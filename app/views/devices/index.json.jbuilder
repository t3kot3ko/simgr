json.array!(@devices) do |device|
  json.extract! device, :id, :sim_id, :user_id, :model_number, :name, :imei, :description
  json.url device_url(device, format: :json)
end
