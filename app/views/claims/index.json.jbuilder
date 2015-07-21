json.array!(@claims) do |claim|
  json.extract! claim, :id, :date, :number, :amount, :description, :policy_id, :client_id, :vehicle_id, :claim_type_id, :claim_status_id
  json.url claim_url(claim, format: :json)
end
