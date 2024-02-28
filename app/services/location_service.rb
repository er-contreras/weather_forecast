require 'uri'
require 'net/http'

module LocationService
  BASE_URL = URI('https://search.reservamos.mx/api/v2/places')

  def self.fetch_city_data(city)
    url = BASE_URL + "?q=#{URI.encode_www_form_component(city)}"
    response = Net::HTTP.get_response(url)

    handle_response(response)
  rescue StandardError => e
    puts "Error fetching data from location API: #{e.message}"
    nil
  end

  private

  def self.handle_response(response)
    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)
    else
      handle_error(response)
      nil
    end
  end

  def self.handle_error(response)
    puts "API request failed with status #{response.code}: #{response.message}"
  end
end
