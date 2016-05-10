class SuburbsController < ApplicationController

  def index
    @suburbs = Suburb.all
  end

end
