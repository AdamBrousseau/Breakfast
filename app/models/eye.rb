class Eye < ActiveRecord::Base
	belongs_to :phr
	default_scope -> { order('date DESC') }
	
	validates :date, presence: true
=begin	
	VALID_BASE_REGEX = /\A^(UP|DOWN|IN|OUT|NA)$\z/i
	validates :glass_od_base, format: { with: VALID_BASE_REGEX}
	validates :glass_os_base, format: { with: VALID_BASE_REGEX}
	
	validates :glass_od_axis, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 180 }
	validates :glass_os_axis, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 180 }
	validates :cont_od_axis, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 180 }
	validates :cont_os_axis, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 180 }
=end
	validates :phr_id, presence: true	
end
