class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :category, index: true
      t.string :title
      t.string :subtitle
      t.string :year
      t.string :format
      t.integer :pages
      t.string :author
      t.string :isbn
      t.float :price
      t.text :description
      t.attachment :index
      t.attachment :image

      t.timestamps
    end
  end
end
