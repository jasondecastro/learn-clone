class User < ActiveRecord::Base
  belongs_to :track
  has_many :lesson_users
  has_many :lessons, through: :lesson_users
end