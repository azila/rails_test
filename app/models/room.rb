class Room < ActiveRecord::Base
  has_many :toys, dependent: :destroy
  has_many :room_comments, as: :commentable
end
