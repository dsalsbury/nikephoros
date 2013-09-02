require 'spec_helper'

feature 'visiting the home page' do
  scenario 'user sees the home page' do
    visit '/'

    expect(page).to have_content 'Nikephoros'
  end
end
