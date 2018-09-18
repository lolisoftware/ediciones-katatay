class AddPositionToCity < ActiveRecord::Migration
  def change
    add_column :cities, :position, :integer, :default => 0
  end
end
