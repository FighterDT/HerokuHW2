class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.
  
  # Get a word from remote "random word" service

  # def initialize()
  # end
  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  attr_accessor :word_with_guesses
  
  def initialize(word2)
    @word = word2.downcase
    @guesses = ""
    @wrong_guesses = ""
    @word_with_guesses = ""
    word2.each_char do @word_with_guesses += "-" end
    
  end

  def guess(letter)
    if(letter == '' or letter == nil or /[a-zA-Z]/ !~letter)
      raise ArgumentError end
    check_win_or_lose
    
    
    @guesses.each_char do |c| 
      if(c == letter.downcase) 
        return false 
      end
    end
      
    @wrong_guesses.each_char do |c| 
      if(c == letter.downcase) 
        return false 
      end
    end
    
   
    
   
    
    @word.each_char  do |x|
      
      if(x == letter.downcase) 
        @guesses += letter
        updateWordWithGuesses
        return true  end
      
    end
    @wrong_guesses += letter.downcase  
    return true
  end
  
  def updateWordWithGuesses
    @word_with_guesses = ""
    @word.each_char do |x|
      
      if @guesses.include?(x)
      @word_with_guesses += x 
    else
      @word_with_guesses += "-" end
      
    end
  end
  
  def check_win_or_lose
  
  if @word == @word_with_guesses
    puts "You Win!"
    return :win end
  if @wrong_guesses.length == 7
    puts "You lose!"
    return :lose end
    puts "Try again"
    return :play
  
  
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
