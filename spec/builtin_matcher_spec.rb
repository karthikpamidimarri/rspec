require_relative '../lib/BuiltInMatcher'

describe BuiltInMatcher do

  let(:builtInMatcher)  {
      BuiltInMatcher.new(0)
  }

  it 'expects result to be equal to 3' do
    expect(builtInMatcher.result).to eq(3)
  end

  it 'expects empty? not to be empty' do
    expect(builtInMatcher).not_to be_empty
  end

  it 'expects result is greaterthan 2' do
    expect(builtInMatcher.result).to be > 2
  end

  it 'expects result is greaterthan equal 2' do
    expect(builtInMatcher.result).to be >= 2
  end

  it 'expects result is lessthan equal 5' do
    expect(builtInMatcher.result).to be <= 5
  end

  it 'expects result is lessthan 5' do
    expect(builtInMatcher.result).to be <= 5
  end

  it 'expects result is between 2 and 5 inclusive' do
    expect(builtInMatcher.result).to be_between(2,3).inclusive
  end

  it 'expects result is between 2 and 5 exclusive' do
    expect(builtInMatcher.result).to be_between(2,4).exclusive
  end

  
end