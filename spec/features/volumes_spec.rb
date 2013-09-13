require 'spec_helper'

feature 'visiting the volumes page' do
  scenario 'user sees a list of volumes' do
    volume = FactoryGirl.create(:volume).decorate

    visit volumes_path

    expect(page).to have_css('td', text: volume.roman_numeral)
    expect(page).to have_css('td', text: volume.year)
    expect(page).to have_css('td', text: volume.isbn)
  end
end
