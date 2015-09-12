class CitiesController < ApplicationController

  def search
    state = State.find_by(abbreviation: params.fetch(:state))
    city = City.find_by( name: params.fetch(:name), state: state)
    cities = CitySearcher.new(city, params.fetch(:distance)).search
    render json: cities
  end

end
