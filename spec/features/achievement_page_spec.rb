require 'rails_helper'

feature 'achievement page' do
  scenario 'achievement public page' do
    achievement = FactoryGirl.create(:achievement, title: 'Just did it')  #create/build create creates record in the database  , build creates only the model in memory
    visit("/achievements/#{achievement.id}")

    expect(page).to have_content('Just did it')

    achievements = FactoryGirl.create_list(:achievement,6)
    p achievements
  end

  scenario 'render markdown description' do
    achievement = FactoryGirl.create(:achievement,description: 'That *was* hard')
    visit("/achievements/#{achievement.id}")

    expect(page).to have_content('<i>was</i>')
  end
end