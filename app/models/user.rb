class User < ActiveRecord::Base
  attr_accessible :classes, :email, :name, :password
  has_many :comments
  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }
  validates :password, presence: true
  validates :classes, presence: true

  #email validates abc@def.com
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}

end
