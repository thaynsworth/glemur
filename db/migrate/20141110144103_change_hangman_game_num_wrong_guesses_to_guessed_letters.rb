class ChangeHangmanGameNumWrongGuessesToGuessedLetters < ActiveRecord::Migration
  def change
    rename_column :hangman_games, :num_wrong_guesses, :guessed_letters
  end
end
