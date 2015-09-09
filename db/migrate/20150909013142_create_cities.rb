class CreateCities < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :abbreviation, null: false, limit: 2
    end

    create_table :cities do |t|
      t.string :name, null: false
      t.references :state, index: true, null: false
    end
  end
end
