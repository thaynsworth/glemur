class AddWinsLosesColumns < ActiveRecord::Migration
  def change
    add_column :hangman_games, :wins, :integer
    add_column :hangman_games, :loses, :integer
  end
end
