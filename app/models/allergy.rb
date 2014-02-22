class Allergy < ActiveRecord::Base
	belongs_to :phr

	validates :allergy_name, presence: true
	
end
