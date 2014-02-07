class Ailment < ActiveRecord::Base
	belongs_to :phr

	validates :ailment_name, presence: true, length: {maximum: 100}
	validates :begin_date, presence: true
	validates :end_date
	validates :ailment_description
end
