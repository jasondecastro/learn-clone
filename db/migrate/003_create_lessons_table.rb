class CreateLessonsTable < ActiveRecord::Migration
  def change
    create_table :lessons do | t |
      t.string :name
      t.text :content
      t.integer :track_id
    end
  end
end
