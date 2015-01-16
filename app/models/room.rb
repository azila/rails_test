class Room < ActiveRecord::Base
  has_many :toys, dependent: :destroy
  has_many :room_comments, as: :commentable

  after_create :send_email

  def send_email
    RoomMailer.new_room_created_email.deliver
  end
end
