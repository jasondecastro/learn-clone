class Track < ActiveRecord::Base
  has_many :users
  has_many :lessons
end