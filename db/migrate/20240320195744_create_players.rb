class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :jersey_number
      t.boolean :won_cup

      t.timestamps
    end
  end
end
