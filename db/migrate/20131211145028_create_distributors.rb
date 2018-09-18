class CreateDistributors < ActiveRecord::Migration
  def change
    create_table :distributors do |t|
      t.string :name, :null => false
      t.string :address, :null => false
      t.belongs_to :city

      t.timestamps
    end
  end
end
