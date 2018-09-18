class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :name, :null => false
      t.text :text, :null => false
      t.timestamps
    end
  end
end
