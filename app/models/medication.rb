class Medication < ActiveRecord::Base
	belongs_to :phr
	default_scope -> {order('begin_date DESC')}
	validates :medication_name, presence: true
	validates :begin_date, presence: true
end
