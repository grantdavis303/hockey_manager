class AddTeamToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_reference :players, :team, foreign_key: true
  end
end
