class City
  include Neo4j::ActiveNode

  property :name
  has_one :out, :state, type: :state
end
