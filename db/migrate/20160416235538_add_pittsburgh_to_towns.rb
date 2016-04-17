class AddPittsburghToTowns < ActiveRecord::Migration
  def change
    town = Town.new
    town.name = "Pittsburgh"
    town.state = "PA"
    town.description = "A great place to live, work, and study."
    town.save!
  end
end
