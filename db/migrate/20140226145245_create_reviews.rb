class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title, :null => false
      t.attachment :text
      t.belongs_to :item

      t.timestamps
    end
  end
end
