class Placeclassify < ActiveRecord::Base
  attr_accessible :name1, :name2, :name3, :instruction
  has_many :places
  # 0 for unclassified
end
