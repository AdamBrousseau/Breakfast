class Contact < ActiveRecord::Base

	default_scope -> { order('name ASC') }
	belongs_to :user
	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	validates :name, presence: true, length: { maximum: 100 }
	validates :phone1, presence: true, length: { maximum: 20 }
	validates :phone2, length: { maximum: 20 }
	validates :email, length: {maximum: 100}, format: { with: EMAIL_REGEX }
	validates :description, length: { maximum: 512 }
	validates :user_id, presence: true
	
end
