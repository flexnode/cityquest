class Foursquare

  def self.try(latitude,longitude)
    conn = ::FaradayStack.build 'https://api.foursquare.com/v2'
    conn.builder.insert_before ::FaradayStack::ResponseJSON, ::Faraday::Response::Mashify

    # JSON resource
    resp = conn.get "venues/search?client_id=#{Settings.foursquare.key}&client_secret=#{Settings.foursquare.secret}&ll=#{latitude},#{longitude}"
    resp.body
  end

  def self.search(query)

    # Hardcode to KK
    latitude = 5.9620886
    longitude = 116.0804111
    conn = ::FaradayStack.build 'https://api.foursquare.com/v2'
    conn.builder.insert_before ::FaradayStack::ResponseJSON, ::Faraday::Response::Mashify

    resp = conn.get "venues/search?client_id=#{Settings.foursquare.key}&client_secret=#{Settings.foursquare.secret}&query=#{query}&radius=100000&&ll=#{latitude},#{longitude}"
    results = resp.body
    locations = []
    results.response.groups[0].items.each {|r| locations << {:name => r.name, :longitude => r.location.lng, :latitude => r.location.lat } }
    locations
  end
end