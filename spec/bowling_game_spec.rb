require_relative '../lib/bowling_game'

describe BowlingGame do
  it 'scores a gutter game' do
    game = BowlingGame.new
    game.pins([0] * 20)
    expect(game.score).to eq(0)
  end

  it 'scores a gutter game of 1s' do
    game = BowlingGame.new
    game.pins([1] *20)
    expect(game.score).to eq(20)
  end
end