class CreateLessonUsersTable < ActiveRecord::Migration
  def change
    create_table :lesson_users do | t |
      t.integer :lesson_id
      t.integer :user_id
      t.boolean :current_lesson
      t.boolean :completed_lesson
    end
  end
end