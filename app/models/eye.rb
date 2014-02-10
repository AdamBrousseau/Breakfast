class Eye < ActiveRecord::Base
	belongs_to :phr
	default_scope -> { order('date DESC') }
	
	validates :date, presence: true
	
	VALID_BASE_REGEX = /\A^(UP|DOWN|IN|OUT|NA)$\z/i
	validates :dv_od_base, format: { with: VALID_BASE_REGEX}
	validates :dv_os_base, format: { with: VALID_BASE_REGEX}
	validates :nv_od_base, format: { with: VALID_BASE_REGEX}
	validates :nv_os_base, format: { with: VALID_BASE_REGEX}

	validates :glass_od_axis :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 180 }
	validates :glass_os_axis :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 180 }
	validates :cont_od_axis :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 180 }
	validates :cont_os_axis :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 180 }

	validates :phr_id, presence: true
end
