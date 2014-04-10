class Fitness < ActiveRecord::Base
	acts_as_paranoid
	belongs_to  :phr
	default_scope -> {order('date DESC')}
	validates :date, presence: true
end
