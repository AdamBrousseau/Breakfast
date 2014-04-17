class Phr < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :user
	has_many :eyes, dependent: :destroy
	has_many :immunizations, dependent: :destroy
	has_many :allergies, dependent: :destroy
	has_many :appointments, dependent: :destroy
	has_many :dentals, dependent: :destroy
	has_many :ailments, dependent: :destroy
	has_many :tests, dependent: :destroy
	has_many :bps, dependent: :destroy
	has_many :bglucoses, dependent: :destroy
	has_many :medications, dependent: :destroy
	has_many :fitnesses, dependent: :destroy

	#has_many :phrshares, dependent: :destroy

	default_scope -> { order('created_at ASC') }
	before_save { self.blood_type = blood_type.downcase }
	validates :first_name, presence: true, length: { maximum: 50 }
	validates :last_name, presence: true, length: { maximum: 50 }
	validates :date_of_birth, presence: true
	VALID_GENDER_REGEX = /\A^(Male|Female)$\z/
	validates :gender, presence: true, format: { with: VALID_GENDER_REGEX }
	VALID_BLOOD_REGEX = /\A^(A|B|AB|O)[+-]$\z/i
	validates :blood_type, format: { with: VALID_BLOOD_REGEX }
	validates :health_card_no, length: { maximum: 50 }, presence: true, uniqueness: true #Each PHR is also Uniquely identified with its Health Card No.
	validates :user_id, presence: true
end
