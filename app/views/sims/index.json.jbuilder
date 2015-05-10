json.array!(@sims) do |sim|
  json.extract! sim, :id, :carrior, :number, :valid, :registered_at, :imsi, :user_id
  json.url sim_url(sim, format: :json)
end
