json.array!(@circles) do |circle|
  json.extract! circle, :id, :name, :url
  json.url circle_url(circle, format: :json)
end
