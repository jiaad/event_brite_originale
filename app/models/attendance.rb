class Attendance < ApplicationRecord
  # after_create :attend_email


  validates :stripe_customer_id, presence: true
  belongs_to :event
  belongs_to :attendant , class_name: "User"

  def attendees_admin_send
    AttendeesMailer.attend_email(@user.attendant.email).deliver_now
  end

end
