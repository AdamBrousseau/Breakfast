class Immunization < ActiveRecord::Base
  belongs_to :phr

  validates :Immunization, presence: true
  validates :date, presence: true
  
end
