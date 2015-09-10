class State
  include Neo4j::ActiveNode

  property :abbreviation, index: :exact

  validates :abbreviation, presence: true

  has_many :in, :cities, origin: :cities

end
