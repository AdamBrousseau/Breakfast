class User < ActiveRecord::Base
	#acts_as_authlogic
	has_secure_password
	has_many :phrs, dependent: :destroy
	has_many :contacts, dependent: :destroy
	before_save { email.downcase! }
	#before_create :create_remember_token
	#before_create :create_activation_token
	before_create { create_token(:remember_token) }
	before_create { create_token(:activation_token) }
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
   	validates :email, presence: true,
 					  format: { with: VALID_EMAIL_REGEX },
 					  uniqueness: { case_sensitive: false }
 	
 	validates :password, length: { minimum: 6, too_short: "must have at least %{count} characters" }
 	validates :password_reset_token, uniqueness: true, allow_nil: true

 	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
	    Digest::SHA1.hexdigest(token.to_s)
	end

	def active?
		active
	end

	#def activate!
	#	self.active=true
	#	save
	#end

	def send_password_reset
	  generate_token(:password_reset_token)
	  self.update_attribute(:password_reset_sent_at, Time.zone.now)
	  #self.password_reset_sent_at = Time.zone.now
	  #save!
	  UserMailer.password_reset(self).deliver
	end

	def generate_token(column)
	  #begin
	    self.update_attribute(column, User.encrypt(User.new_token))
	    #self[column] = User.encrypt(SecureRandom.urlsafe_base64)
	  #end while User.exists?(column => self[column])
	end

  	private

	    def create_token(column)
	      self[column] = User.encrypt(User.new_token)
	    end

	    #def create_activation_token
	    #  self.activation_token = User.encrypt(User.new_remember_token)
	    #end
end
