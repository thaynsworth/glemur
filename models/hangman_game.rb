class HangmanGame < ActiveRecord::Base
  belongs_to :user

  def guess_letter(letter)
  idx = self.word.index(letter) # set variable 'idx' to find index of letter
  if idx
    state = self.game_state.dup
    state[idx] = letter
    self.game_state = state
  else
    self.guessed_letters += letter # add letter to bad_guesses column
  end
    self.save
  end

  def game_result(word, game_state)
    if word == game_state
      self.wins + 1
    else
      self.loses + 1
    end
    self.save
  end

end