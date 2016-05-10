module Api
  class SuburbsController < ApplicationController

    def get_suburbs
    @suburbs = Suburb.all
    render json: @suburbs.to_json
    end

  end
end
