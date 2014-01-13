require 'spec_helper'

feature 'visiting the supplements admin section' do
  scenario 'the user sees a list of supplements' do
    supplement = FactoryGirl.create(:supplement)
    log_in_admin_user
    visit admin_supplements_path

    expect(page).to have_css('tr', text: supplement.title)
  end
end

feature 'adding a new supplement', :js do
  scenario 'the user adds a new supplement and is redirected to the show page' do
    author = FactoryGirl.create(:author).decorate
    supplement = FactoryGirl.build_stubbed(:supplement)

    log_in_admin_user
    visit new_admin_supplement_path

    fill_in 'Number', with: supplement.number
    fill_in 'Title', with: supplement.title
    select2 author.full_name, from: 'Authors'
    fill_in 'Pages', with: supplement.pages
    fill_in 'Description', with: supplement.description
    attach_file 'PDF', File.join(Rails.root, 'spec', 'support', 'test.pdf')
    click_on 'Create Supplement'

    expect(current_path).to eql(admin_supplement_path(Supplement.last))
    expect(page).to have_content('Supplement was successfully created')
    expect(Supplement.count).to eql(1)
  end
end
