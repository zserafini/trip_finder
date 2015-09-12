class CitySearcher
  
  def initialize city, distance
    @city = city
    @distance = distance
  end

  def search
    search_result = []
    city.cities(:c2, :r).where("r.distance <= #{distance}").order("r.distance").each_with_rel do |node, rel|
      search_result << { name: node.name, state: node.state.abbreviation, distance: rel[:distance] }
    end
    search_result
  end

  private
  attr_reader :city, :distance
end

