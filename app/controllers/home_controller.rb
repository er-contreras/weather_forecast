class HomeController < ApplicationController
  def search
    query = params[:query]

    if query.present?
      data = ApiService.fetch_data(query)

      city = data.find { |city| city if city["result_type"] == "city" } if data.present?

      lat = city["lat"]
      long = city["long"]

      @weather = WeatherService.fetch_data(lat, long) if lat.present? && long.present?

      # if @weather.present?
      #   @weather["list"].map do |weather|
      #     {
      #       date: weather["dt_txt"],
      #       temperature: weather["main"]["temp"],
      #       description: weather["weather"].first["description"]
      #     }
      #   end
      # end
    end
  end
end
