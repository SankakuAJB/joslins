class AddScoreColumnToCompetitors < ActiveRecord::Migration
  def change
    add_column :competitors, :score, :integer
  end
end
