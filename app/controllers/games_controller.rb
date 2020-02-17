require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letter = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @letters = params[:letter]
    @result = params[:world]
    url = "https://wagon-dictionary.herokuapp.com/#{@result}"
    api_word = open(url).read
    @word_desc = JSON.parse(api_word)
    valid
  end

  def valid
    each_l = params[:world].split
    each_l.each do |let|
      if @letters.include?(let)
        @answer = "yes"
      else
        @answer = "Jack"
      end
    end
  end
end
