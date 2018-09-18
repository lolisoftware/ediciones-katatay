class AddDigitalToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :digital, :boolean
  end
end
