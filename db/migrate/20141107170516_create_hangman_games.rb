class CreateHangmanGames < ActiveRecord::Migration
  def change
    create_table :hangman_games do |t|
      t.integer :user_id
      t.string :word
      t.string :game_state
      t.string :num_wrong_guesses
      t.timestamps
    end
  end
end
