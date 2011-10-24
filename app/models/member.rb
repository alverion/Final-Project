require 'digest/sha2'

class Member < ActiveRecord::Base
	has_many :cliq_members
	has_many :cliq_invitations

	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :email, :uniqueness => true
	
	validates :password, :confirmation => true
	attr_accessor :password_confirmatin
	attr_reader :password

	validate :password_must_be_present

	def Member.authenticate(email, password)
		if member = find_by_email(email)
			if member.hashed_password == encrypt_password(password, member.salt)
				member
			end
		end
	end

	def Member.encrypt_password(password, salt)
		Digest::SHA2.hexdigest(password + "wibble" + salt)
	end

	# 'password' is a virtual attribute
	def password=(password)
		@password = password

		if password.present?
			generate_salt
			self.hashed_password = self.class.encrypt_password(password, salt)
		end
	end
	
	private
		
		def password_must_be_present
			errors.add(:password,"Missing password") unless hashed_password.present?
		end

		def generate_salt
			self.salt = self.object_id.to_s + rand.to_s
		end
end
