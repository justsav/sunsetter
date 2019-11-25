class Location < ApplicationRecord
  belongs_to :user
  validates :city, presence: true

  def weather_info
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{self.city}&APPID=#{ENV['APIKEY']}"
    response = RestClient.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end

