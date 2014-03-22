class Fitness < ActiveRecord::Base
	belongs_to  :phr
	default_scope -> {order('date DESC')}
	validates :date, presence: true
end
