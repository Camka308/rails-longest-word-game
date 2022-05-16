class GamesController < ApplicationController

  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end



  def score
    @word = params[:word]
    @letters = params[:letters]
    if included?(@word, @letters)
      if english_word?
        @answer = "Well done !"
      else
        @answer = "It's not an english word. Try again."
      end
    else
      @answer = "Some letters are not in the grid, try again."
    end
  end

  private

  def included?(guess, grid)
    guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
  end

  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']
  end

end
