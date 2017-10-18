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
      achievement.valid?  #Make an action

      #Expectations
      expect(achievement.errors[:title]).to include("can't be blank")
      #another way of testing the same thing
      expect(achievement.errors[:title]).not_to be_empty

    end
  end
end
