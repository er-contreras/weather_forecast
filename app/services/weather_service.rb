module WeatherService
  BASE_URL = URI('https://api.openweathermap.org/data/2.5/forecast')
  API_KEY = ENV['WEATHER_API_KEY']

  def self.fetch_data(lat, lon)
    url = URI("#{BASE_URL}?lat=#{lat}&lon=#{lon}&appid=#{API_KEY}&units=metric")
    response = Net::HTTP.get_response(url)

    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)
    else
      puts "API request failed with status #{response.code}: #{response.message}"
      nil
    end

  rescue StandardError => e
    puts "Error fetching data from API: #{e.message}"
    nil
  end
end