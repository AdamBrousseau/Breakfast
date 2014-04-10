class Allergy < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :phr

	validates :allergy_name, presence: true
	
end
