class Contact < ActiveRecord::Base
	acts_as_paranoid
	default_scope -> { order('name ASC') }
	belongs_to :user
	before_save { email.downcase! }
	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	validates :name, presence: true, length: { maximum: 100 }
	validates :phone1, presence: true, length: { maximum: 30 }
	validates :phone2, length: { maximum: 30 }
	validates :email, length: {maximum: 100}, format: { with: EMAIL_REGEX }
	validates :description, length: { maximum: 512 }
	validates :user_id, presence: true
	
end
