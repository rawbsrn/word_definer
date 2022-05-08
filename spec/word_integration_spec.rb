require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates an word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'Bee')
    click_on('Go!')
    expect(page).to have_content('Bee')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates an word and then goes to the word page') do
    word = Word.new("Bee", nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'An insect of a large group to which the honeybee belongs, including many solitary as well as social kinds.')
    click_on('Add definition')
    expect(page).to have_content('An insect of a large group to which the honeybee belongs, including many solitary as well as social kinds.')
  end
end