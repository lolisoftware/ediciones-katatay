class AddPositionToState < ActiveRecord::Migration
  def change
    add_column :states, :position, :integer, :default => 0
  end
end
