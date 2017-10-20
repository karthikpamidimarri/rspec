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

    it {should validate_presence_of(:title)}

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

    it {should validate_uniqueness_of(:title).scoped_to(:user_id).with_message("you can't have two achievements with the same title")}

    it 'belong to user' do
      achievement = Achievement.new(title: 'Some title', user:nil)
      expect(achievement.valid?).to be_falsey
    end

    it {should validate_presence_of(:user)}

    it { should belong_to(:user) }

    it 'converts markdown to html' do
      achievement = Achievement.new(description: 'Awesome **thing** I *actually* did' )
      p achievement.description_html
      expect(achievement.description_html).to include('<strong>thing</strong>')
      expect(achievement.description_html).to include('<em>actually</em>')
    end

    it 'has silly title' do
      achievement = Achievement.new(title: "New Achievement", user: FactoryGirl.create(:user, email: 'test@test.com'))
      expect(achievement.silly_title).to eq('New Achievement by test@test.com')
    end

    it 'only fetches achievements which title starts from provided letter' do
      user = FactoryGirl.create(:user)
      achievement1 = FactoryGirl.create(:public_achievement, title: 'Read a book', user: user)
      achievement2 = FactoryGirl.create(:public_achievement, title: 'Passed an exam', user: user)
      expect(Achievement.by_letter("R")).to eq([achievement1])
    end
  end
end
