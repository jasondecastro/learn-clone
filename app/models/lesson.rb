class Lesson < ActiveRecord::Base
  has_many :lesson_users
  has_many :users, through: :lesson_users
end