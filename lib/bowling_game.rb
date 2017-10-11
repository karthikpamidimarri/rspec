class BowlingGame

  attr_reader :first_in_frame
  
  def initialize
    @first_in_frame =0 #Index for frame
  end

  def pins(rolls)
    @rolls = rolls
  end

  def score
    frame = 0 # current frame start with 0
    score = 0


    while frame < 10
      if spare?
        score += 10 + @rolls[first_in_frame + 2]
      else
        #Regular implementation
        score += @rolls[first_in_frame] + @rolls[first_in_frame + 1]
      end

      frame += 1
      @first_in_frame += 2
    end

    score
  end

  def spare?
    @rolls[first_in_frame] + @rolls[first_in_frame + 1] == 10
  end
end