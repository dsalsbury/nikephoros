require 'spec_helper'

feature 'visiting the supplements page' do
  scenario 'user sees a list of supplements' do
    supplement = FactoryGirl.create(:supplement).decorate

    visit supplements_path

    expect(page).to have_css('td', text: supplement.number)
    expect(page).to have_css('td', text: supplement.author_names)
    expect(page).to have_css('td', text: supplement.title)
    expect(page).to have_css('td', text: supplement.pages)
  end
end
