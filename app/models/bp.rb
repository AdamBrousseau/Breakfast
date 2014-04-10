class Bp < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :phr
	default_scope -> { order('date DESC') }
	
	validates :date, presence: true

	validates :systolic, presence: true, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 400 }
	validates :diastolic, presence: true, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 400 }

	validates :phr_id, presence: true	
end
