class Pub < ActiveRecord::Base
  has_many :users
  has_many :events
  has_many :invites

  def self.import_from_zomato!
    user_key = 'ddd25bb501263163e2f0a9557e59e517'
    response = HTTParty.get('https://developers.zomato.com/api/v2.1/search?entity_type=city&q=bangalore&category=3', headers: {"user-key" => user_key})
    results = JSON.parse(response.to_json)
    restaurants = results['restaurants']
    restaurants.each do |restaurant|
      pub = Pub.new
      pub.name = restaurant['restaurant']['name']
      pub.location = restaurant['restaurant']['location']['address']
      pub.locality = restaurant['restaurant']['location']['locality']
      pub.city = restaurant['restaurant']['location']['city']
      pub.latitude = restaurant['restaurant']['location']['latitude']
      pub.longitude = restaurant['restaurant']['location']['longitude']
      pub.avg_cost = restaurant['restaurant']['average_cost_for_two']
      n = rand(20..100)
      pub.meet_time = Date.today.advance(days: n)
      pub.image_url = restaurant['restaurant']['featured_image']
      pub.url = restaurant['restaurant']['url']
      pub.rating = restaurant['restaurant']['user_rating']['aggregate_rating']
      pub.save
      
    end
  end
end
