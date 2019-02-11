class Event < ApplicationRecord
    # after_create :attend_email

    has_many :attendances
    # has_many :users
    has_many :attendants, class_name: "User", through: :attendances
    belongs_to :admin , class_name: "User"


    validates :start_date, presence:true
    validates :duration , presence:true
    validates :title, presence:true,length: {in: 3...50}
    validates :description , presence:true, length:{minimum: 5}
    validates :price , presence:true,:format => { :with => /^(\$)?(\d+)(\.|,)?\d{0,2}?$/ }
    validates :location, presence:true
end
