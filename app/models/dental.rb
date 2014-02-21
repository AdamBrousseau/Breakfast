class Dental < ActiveRecord::Base
	belongs_to :phr

	validates :dentist, presence: true
end
