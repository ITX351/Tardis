class Comment < ActiveRecord::Base
  attr_accessible :article_id, :content, :status, :user_id
  belongs_to :user
end
