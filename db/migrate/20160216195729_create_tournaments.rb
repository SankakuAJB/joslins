class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :medal
      t.integer :multiplier

      t.timestamps null: false
    end
  end
end
