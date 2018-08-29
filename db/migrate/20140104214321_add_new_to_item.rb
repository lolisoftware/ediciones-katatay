class AddNewToItem < ActiveRecord::Migration
  def change
    add_column :items, :new, :boolean
  end
end
