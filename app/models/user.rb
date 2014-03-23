class User < ActiveRecord::Base
	#acts_as_authlogic
	has_secure_password
	has_many :phrs, dependent: :destroy
	has_many :contacts, dependent: :destroy
	before_save { email.downcase! }
	before_create :create_remember_token
	before_create :create_activation_token
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
   	validates :email, presence: true,
 					  format: { with: VALID_EMAIL_REGEX },
 					  uniqueness: { case_sensitive: false }
 	
 	validates :password, length: { minimum: 6, too_short: "must have at least %{count} characters" }

 	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
	    Digest::SHA1.hexdigest(token.to_s)
	end

	def active?
		active
	end

	def activate!
		self.active=true
		save
	end

  	private

	    def create_remember_token
	      self.remember_token = User.encrypt(User.new_remember_token)
	    end

	    def create_activation_token
	      self.activation_token = User.encrypt(User.new_remember_token)
	    end
end
