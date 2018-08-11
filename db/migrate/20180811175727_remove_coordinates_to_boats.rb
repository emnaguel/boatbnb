class RemoveCoordinatesToBoats < ActiveRecord::Migration[5.2]
  def change
    remove_column :boats, :latitude, :float
    remove_column :boats, :longitude, :float
  end
end
