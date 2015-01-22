class CarsController < ApplicationController

  #GET /cars
  #This is the index action. This will be invoked to view all the cars.
  def index
    @cars = Car.all
  end
end
