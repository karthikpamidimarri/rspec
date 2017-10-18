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

    it 'requires title to be unique for one user' do
      user = FactoryGirl.create(:user)
      first_achievement = FactoryGirl.create(:public_achievement, title: 'First Achievement', user: user)
      new_achievement = Achievement.new(title: 'First Achievement', user: user)
      expect(new_achievement.valid?).to be_falsy
    end

    it 'allows different users to have achievements with identical titles' do
      #Prepare data in the database
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      first_achievement = FactoryGirl.create(:public_achievement, title: 'First Achievement', user: user1)

      #Instantiate model on the test with values that we need
      new_achievement = Achievement.new(title: 'First Achievement', user: user2)
      expect(new_achievement.valid?).to be_truthy
    end
  end
end
