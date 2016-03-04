class AddAbsoluteColumnToMedals < ActiveRecord::Migration
  def change
    add_column :medals, :absolute, :integer
  end
end
