class FriendPage < ActiveRecord::Base
  validates :name, :url, :presence => true
end
