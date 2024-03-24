class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :season_wins
      t.boolean :playoff_eligible

      t.timestamps
    end
  end
end
