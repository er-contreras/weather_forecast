require 'rails_helper'

RSpec.describe "Home", type: :request do
  describe 'GET #search' do
    context 'with valid query' do
      let(:city_data) { { 'lat' => 40.7128, 'lon' => -74.0060, 'result_type' => 'city' } }
      let(:weather_forecast) {
        Forecast.new([
                       {
                         "dt": 1709186400,
                         "main": {
                           "temp": 277.45,
                           "feels_like": 271.93,
                           "temp_min": 274.92,
                           "temp_max": 277.45,
                           "pressure": 1012,
                           "sea_level": 1012,
                           "grnd_level": 1014,
                           "humidity": 49,
                           "temp_kf": 2.53
                         },
                         "weather": [
                           {
                             "id": 600,
                             "main": "Snow",
                             "description": "light snow",
                             "icon": "13n"
                           }
                         ],
                         "clouds": {
                           "all": 100
                         },
                         "wind": {
                           "speed": 9.59,
                           "deg": 303,
                           "gust": 18.28
                         },
                         "visibility": 10000,
                         "pop": 1,
                         "snow": {
                           "3h": 0.15
                         },
                         "sys": {
                           "pod": "n"
                         },
                         "dt_txt": "2024-02-29 06:00:00"
                       },
                     ],
                     'New York')
      }

      before do
        allow(LocationService).to receive(:fetch_city_data).and_return([city_data])
        allow(WeatherService).to receive(:fetch_forecast).and_return(weather_forecast)
        get '/search', params: { query: 'New York' }
      end

      it 'returns a successful response' do
        expect(response).to have_http_status(:success)
      end

      it 'assigns @data and @city_name' do
        expect(response.body).to include('<h3>New York</h3>')
      end
    end

    context 'with invalid query' do
      before do
        allow(LocationService).to receive(:fetch_city_data).and_return([])
        get '/search', params: { query: '' }
      end

      it 'returns a successful response' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the search template' do
        expect(response.body).to include('')
      end
    end
  end
end
