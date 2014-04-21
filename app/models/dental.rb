class Dental < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :phr

	validates :date, presence: true
	validates :description, presence: true
end
