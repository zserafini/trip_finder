State.list.each do |abbreviation|
  State.where(abbreviation: abbreviation).first_or_create!
end

City.joins(:state).where(
  name: "Columbus",
  states: { abbreviation: "OH" }).first_or_create! do |s|
    s.state = State.find_by(abbreviation: "OH")
  end
