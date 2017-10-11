class BowlingGame

  def pins(rolls)
    @rolls = rolls
  end

  def score
    @rolls.inject(:+)
  end


end