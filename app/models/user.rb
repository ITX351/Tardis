class User < ActiveRecord::Base
  	# Include default devise modules. Others available are:
  	# :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
        	 :recoverable, :rememberable, :trackable, :validatable, :confirmable

	# Setup accessible (or protected) attributes for your model
	attr_accessible :email, :password, :password_confirmation, :remember_me, :nickname
	# attr_accessible :title, :body

	has_many :comments
	ajaxful_rater
end
