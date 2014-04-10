class Ailment < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :phr
	default_scope -> { order('begin_date DESC') }
	validates :ailment_name, presence: true
	validates :begin_date, presence: true
end
