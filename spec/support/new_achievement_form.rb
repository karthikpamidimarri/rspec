class NewAchievementForm
  include Capybara::DSL  # because of this include we can visit and fill_in other capybara we can access

  def visit_page
    visit('/')
    click_on('New Achievement')
    self     # This way chain our messages
  end

  def fill_in_with(params = {})
    fill_in('Title', with: 'Read a book')
    fill_in('Description', with:  'Nice book !!!')
    select('Public', from: 'Privacy')
    check('Featured achievement')
    attach_file('Cover image', "#{Rails.root}/spec/fixtures/cover_image.png")

    self

  end

  def submit
    click_on('Create Achievement')
    self
  end
end