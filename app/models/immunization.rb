class Immunization < ActiveRecord::Base
  belongs_to :phr

  validates :immunization, presence: true
  validates :date, presence: true
  
end
