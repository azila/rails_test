class RoomMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_room_created_email
    mail(to: 'Korotchenko.liza@gmail.com', subject: 'New room created!')
  end

end
