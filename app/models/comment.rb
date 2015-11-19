class Comment < ActiveRecord::Base
  attr_accessible :place_id, :content, :status, :user_id
  belongs_to :user
  belongs_to :place
end
