class Lesson < ActiveRecord::Base
  belongs_to :track
  has_many :lesson_users
  has_many :users, through: :lesson_users
end
