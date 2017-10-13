require 'rails_helper'

#In the feature file will use featrue instead of describe
feature 'home page' do
  scenario 'welcome message' do # we use scenario instead of 'it' to specify the example
    #This is the BDD of wording
      visit('/')
      expect(page).to have_content('Welcome')
  end
end