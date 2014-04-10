class Immunization < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :phr

  validates :immunization, presence: true
  validates :date, presence: true
  
end
