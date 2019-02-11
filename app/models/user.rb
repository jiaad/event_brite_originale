class User < ApplicationRecord
    after_create :welcome_send

    has_many :attending_events, foreign_key: 'attendant_id', class_name: "Event"
    has_many :managed_events, foreign_key: 'admin_id', class_name:"Event"
    # has_secure_password
    validates :description, presence:true
    
    def welcome_send
        UserMailer.welcome_email(self).deliver_now
    end
    
end
