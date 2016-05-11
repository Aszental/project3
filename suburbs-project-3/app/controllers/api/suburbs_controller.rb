

module Api
  class SuburbsController < ApplicationController

    def get_suburbs
      @suburbs = Suburb.all
      render json: @suburbs.to_json
    end

    def suburb_selection

      min_price = params[:min_price].to_i
      max_price = params[:max_price].to_i

      suburbs = Suburb.all
      suburb_array = []




      suburbs.each do |suburb|
        if (suburb.median_price_unit < max_price && suburb.median_price_unit > min_price) || (suburb.median_price_house < max_price && suburb.median_price_house > min_price)
          suburb_array.push({suburbName: suburb.suburb_name, housePrice: suburb.median_price_house, geocode: suburb.geocode })
        end
      end

      render json: suburb_array.to_json, status: 200

#      binding.pry
    end
  end
end
