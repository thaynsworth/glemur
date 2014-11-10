class HangmanGame < ActiveRecord::Base
  belongs_to :user

  def guess_letter(letter)
  idx = self.word.index(letter) # set variable 'idx' to find index of letter
  if idx
    state = self.game_state.dup
    state[idx] = letter
    self.game_state = state
  else
    self.num_wrong_guesses += letter.to_s       # add letter to bad_guesses column
  end
    self.save
  end

end