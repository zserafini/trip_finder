class City
  include Neo4j::ActiveNode

  property :name
  #property :population, type: Integer
  has_one :out, :state, type: :state
  has_many :both, :cities, type: 'city_to_city'
end
