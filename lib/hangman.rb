class Hangman

  # Initialize the game status parameters.
  def self.set_game(word_length)
    secret_word = Hangman.pick_word(word_length)
    # Create horizontal lines
    hidden_word = secret_word.split("").map { |x| "_" }

    {
      secret_word: secret_word,
      hidden_word: hidden_word,
      turns: 6,
    }
  end

  def self.play(status, guess)
    secret_word = status[:secret_word].split("")

    if secret_word.include?(guess)
      # Update hidden word
      secret_word.each_index do |i|
        status[:hidden_word][i] = guess if status[:secret_word][i] == guess
      end
    else
      status[:turns] -= 1
    end

    status
  end

  def self.game_over?(status)
    if status[:secret_word] == status[:hidden_word].join
      "/win"
    elsif status[:turns] == 0
      "/lose"
    else
      "/game"
    end
  end

  def self.pick_word(word_length)
    word = File.readlines("lib/app/public/dictionary/5desk.txt")

    word.map! { |w| w.gsub("\n", "") }
    # Select words which has the same length as given parameter
    word.select! { |w| w.length == word_length }
    # Randomly sample a word
    word.sample
  end
end