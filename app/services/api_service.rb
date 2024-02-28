require 'uri'
require 'net/http'

module ApiService
  BASE_URL = URI('https://search.reservamos.mx/api/v2/places')

  def self.fetch_data(city)
    url = URI("#{BASE_URL}?q=#{city}")
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
