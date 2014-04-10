class Bglucose < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :phr
	default_scope -> { order('date DESC') }
	
	validates :date, presence: true

	validates :sugar, presence: true

	validates :btype, length: { maximum: 11 }
	validates :comments, length: { maximum: 200 }

	validates :phr_id, presence: true	
end
