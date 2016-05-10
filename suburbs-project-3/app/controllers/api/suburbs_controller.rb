

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
      sub_select_units = []
      sub_select_houses = []

      suburbs.each do |suburb|
        if suburb.median_price_unit < max_price
          if suburb.median_price_unit > min_price
            sub_select_units.push(suburb.suburb_name)
          end
        end
        if suburb.median_price_house < max_price
          if suburb.median_price_house > min_price
            sub_select_houses.push(suburb.suburb_name)
          end
        end
      end

      suburb_hash = {unit_afford_subs: sub_select_units, houses_afford_subs: sub_select_houses}
      render json: suburb_hash.to_json, status: 200

#      binding.pry
    end
  end
end
