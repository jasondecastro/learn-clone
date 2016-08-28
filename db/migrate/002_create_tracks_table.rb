class CreateTracksTable < ActiveRecord::Migration
  def change
    create_table :tracks do | t |
      t.string :name
    end
  end
end