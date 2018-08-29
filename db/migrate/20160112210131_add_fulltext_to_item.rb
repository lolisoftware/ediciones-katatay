class AddFulltextToItem < ActiveRecord::Migration
  def change
    add_attachment :items, :fulltext
  end
end
