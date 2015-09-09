class CitiesController < ApplicationController

  def search
    city = City.joins(:state).find_by(
      name: params.fetch(:name),
      states: { abbreviation: params.fetch(:state) } )

    render json: city
  end

end
