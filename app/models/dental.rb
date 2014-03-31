class Dental < ActiveRecord::Base
	belongs_to :phr

	validates :dentist, presence: true
	validates :last_visit, presence: true
	validates :description, presence: true
end
