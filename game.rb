class Character

end

describe Character do
  describe 'climbing check skill' do
    let(:die){double} # In rspec we create double with simple double
    let(:character) { Character.new(strength:5, die: die)}

    it 'climbs successfully when roll + strength is more than difficulty' do
      expect(character.climb(difficulty: 15)).to be_truthy
    end
    it 'fails climbing check when roll + strength is less than difficulty'


  end
end