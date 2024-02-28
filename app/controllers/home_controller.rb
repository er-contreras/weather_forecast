class HomeController < ApplicationController
  def search
    query = params[:query]

    if query.present?
      data = ApiService.fetch_data(query)

      city = data.find { |city| city if city["result_type"] == "city" } if data.present?

      lat = city["lat"]
      long = city["long"]

      forecast = WeatherService.fetch_data(lat, long) if lat.present? && long.present?

      if forecast.present?
        @data =  forecast["list"]
        @city_name = forecast["city"]["name"]
      end
    end
  end
end
