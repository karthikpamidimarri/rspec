class BowlingGame

  def pins(rolls)
    @score = rolls.inject(:+);
  end

  def score
    @score
  end


end