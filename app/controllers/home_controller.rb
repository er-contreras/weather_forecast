class HomeController < ApplicationController
  def search
    query = params[:query]

    if query.present?
      data = LocationService.fetch_city_data(query)
      city_data = data.find { |city| city if city["result_type"] == "city" } if data.present?

      if city_data.present?
        weather_forecast = WeatherService.fetch_forecast(city_data)
        if weather_forecast.present?
          @data = weather_forecast.list
          @city_name = weather_forecast.city_name
        end
      end
    end
  end
end
