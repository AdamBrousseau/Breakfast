class Appointment < ActiveRecord::Base
	belongs_to :phr

	validates :doctor, presence: true
	validates :appointment_date, presence: true

	def start_time
		appointment_date
	end
end
