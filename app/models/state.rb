class State
  include Neo4j::ActiveNode

  property :abbreviation, index: :exact

  validates :abbreviation, presence: true

  has_many :in, :cities, origin: :cities

  def self.list
    [
      "AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL",
      "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA",
      "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE",
      "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI",
      "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA", "WI", "WV",
      "WY"
    ]
  end

end
