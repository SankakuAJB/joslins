class CreateMedals < ActiveRecord::Migration
  def change
    create_table :medals do |t|
      t.integer :value
      t.integer :tournament_id
      t.integer :competitor_id

      t.timestamps null: false
    end
  end
end
