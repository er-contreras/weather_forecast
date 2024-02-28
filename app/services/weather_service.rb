require 'net/http'
require 'json'

module WeatherService
  BASE_URL = URI('https://api.openweathermap.org/data/2.5/forecast')
  API_KEY = ENV['WEATHER_API_KEY']

  def self.fetch_forecast(city_data)
    lat = city_data['lat']
    lon = city_data['long']
    url = URI("#{BASE_URL}?lat=#{lat}&lon=#{lon}&appid=#{API_KEY}&units=metric")
    response = Net::HTTP.get_response(url)

    if response.is_a?(Net::HTTPSuccess)
      parse_response(response)
    else
      handle_error(response)
      nil
    end
  rescue StandardError => e
    puts "Error fetching data from weather API: #{e.message}"
    nil
  end

  private

  def self.parse_response(response)
    data = JSON.parse(response.body)
    Forecast.new(data['list'], data['city']['name'])
  end

  def self.handle_error(response)
    puts "API request failed with status #{response.code}: #{response.message}"
  end
end

class Forecast
  attr_reader :list, :city_name

  def initialize(list, city_name)
    @list = list
    @city_name = city_name
  end
end
