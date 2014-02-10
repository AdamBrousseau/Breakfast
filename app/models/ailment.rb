class Ailment < ActiveRecord::Base
	belongs_to :phr

	validates :ailment_name, presence: true
	validates :begin_date, presence: true
	
end
