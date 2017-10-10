require_relative '../lib/playground.rb'

#Example group string as an argument 
#Describe what we test
describe Playground do 
     #Bundle example with common context
   context 'when there are no children' do

      #To define examples themselves
      it 'is quite boring place' do
         #expect(actual_value).to equal(expected_value)
	       playground = Playground.new(0)
         mood = playground.mood
         expect(mood).to eq('boring')
      end

      it 'is empty' do
        playground = Playground.new(0)
        expect(playground).to be_empty
      end
   end
end
