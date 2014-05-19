require 'bcrypt'

class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  validates :email, :name, uniqueness: :true, presence: :true

  has_many :bites

  def password
  	@password
  end

  def password=(new_password)
  	@password = new_password
  	self.password_digest = BCrypt::Password.create(new_password)
  end


  def authenticate(login_password)
  	if BCrypt::Password.new(self.password_digest) == login_password
		self
	else
		false
	end
  end


end
