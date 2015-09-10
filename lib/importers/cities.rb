module CitiesImporter
  require 'csv'

  # Import city data from csv
  # name, state abbreviation

  def self.import
    file_path = 'data/cities.csv'
    data = File.read(file_path)
    parsed_data = CSV.parse(data, :headers => true)
    parsed_data.first(4).each do |city|
      state = State.find_by(abbreviation: city["abbreviation"])
      new_city = City.create!(name: city["name"].strip, state: state)
      self.create_city_to_city_relationship new_city
    end
  end

  def self.create_city_to_city_relationship city
    binding.pry
    #other_cities = City.where("NOT result_city.uuid = \"#{city.id}\"")
    City.all.each do |other_city|
      next if city == other_city
      city.cities << other_city
    end
    city.cities.each_with_rel do |c, r|
      r["distance"] = rand(1000)
    end
  end

end
