require 'rails_helper'

RSpec.describe Achievement, type: :model do

  describe 'validations' do
    it 'requires title' do
=begin
       model specs are very easy it has standard structure for testing

        1) Arrange data
        2)Make action
        3)Assert something
=end
      achievement = Achievement.new(title: '')  # creating data with empty title
      #achievement.valid?  #Make an action

      #Expectations
=begin
        expect(achievement.errors[:title]).to include("can't be blank")
=end
      #another way of testing the same thing
=begin
      expect(achievement.errors[:title]).not_to be_empty
=end

      #with single line we can test
      expect(achievement.valid?).to be_falsy
    end

    
  end
end
