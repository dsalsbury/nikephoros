require 'spec_helper'

feature 'visiting the volumes admin section' do
  scenario 'the user sees a list of volumes' do
    volume = FactoryGirl.create(:volume)
    log_in_admin_user
    visit admin_volumes_path

    expect(page).to have_css('tr', text: volume.number)
  end
end

feature 'adding a new volume' do
  scenario 'the user adds a new volume and is redirected to the show page' do
    volume = FactoryGirl.build_stubbed(:volume)

    log_in_admin_user
    visit new_admin_volume_path

    fill_in 'Number', with: volume.number
    fill_in 'Year', with: volume.year
    fill_in 'ISBN', with: volume.isbn
    click_on 'Create Volume'

    expect(current_path).to eql(admin_volume_path(Volume.last))
    expect(page).to have_content('Volume was successfully created')
    expect(Volume.count).to eql(1)
  end
end
