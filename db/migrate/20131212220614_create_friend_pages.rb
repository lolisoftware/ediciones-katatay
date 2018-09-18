class CreateFriendPages < ActiveRecord::Migration
  def change
    create_table :friend_pages do |t|
      t.string :name
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
