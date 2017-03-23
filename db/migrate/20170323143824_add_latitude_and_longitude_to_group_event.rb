class AddLatitudeAndLongitudeToGroupEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :group_events, :latitude, :float
    add_column :group_events, :longitude, :float
  end
end
