class Appointment < ActiveRecord::Base
	belongs_to :phr

	validates :doctor, presence: true
	validates :reason, presence: true
	validates :results, presence: true
    validates :appointment_date, presence: true
end
