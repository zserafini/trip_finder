module StatesImporter
  require 'csv'

  # Import state data from csv
  # abbreviation

  def self.import
    file_path = 'data/states.csv'
    data = File.read(file_path)
    parsed_data = CSV.parse(data, :headers => true)
    parsed_data.each do |state|
      State.create!(abbreviation: state["abbreviation"])
    end
  end

end
