class User < ActiveRecord::Base
  attr_accessible :classes, :email, :name, :password
  has_many :comments
end
