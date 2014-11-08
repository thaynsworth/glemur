class HangmanGame < ActiveRecord::Base
  belongs_to :user

  def guess_letter(letter)

  idx = self.word.index(letter) # set variable 'idx' to find index of letter
  if idx
    state = self.game_status.dup
    state[idx] = letter
    self.game_status = state
  else
    bad_guesses += letter       # add letter to bad_guesses column
  end

    self.save

  end
end