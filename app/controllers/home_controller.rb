class HomeController < ApplicationController
  def search
    @search = params[:query]

    if @search.present?
      # Fetch the results from external API

    end
  end
end
