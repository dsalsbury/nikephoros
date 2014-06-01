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
  let(:supplement) { FactoryGirl.build_stubbed(:supplement) }

  before(:each) do
    @author = FactoryGirl.create(:author).decorate

    log_in_admin_user
    visit new_admin_supplement_path
  end

  scenario 'the user adds a new supplement and is redirected to the show page' do
    fill_in 'Number', with: supplement.number
    fill_in 'Title', with: supplement.title
    select2 @author.full_name, from: 'Authors'
    fill_in 'Pages', with: supplement.pages
    fill_in 'Description', with: supplement.description
    attach_file 'PDF', File.join(Rails.root, 'spec', 'support', 'test.pdf')
    click_on 'Create Supplement'

    expect(current_path).to eql(admin_supplement_path(Supplement.last))
    expect(page).to have_content('Supplement was successfully created')
    expect(Supplement.count).to eql(1)
  end

  scenario 'validation fails and attributes remain set' do
    fill_in 'Number', with: supplement.number
    fill_in 'Title', with: supplement.title
    select2 @author.full_name, from: 'Authors'
    fill_in 'Description', with: supplement.description
    attach_file 'PDF', File.join(Rails.root, 'spec', 'support', 'test.pdf')
    click_on 'Create Supplement'

    # save_and_open_page

    expect(current_path).to eq(admin_supplements_path)
    expect(page).to have_css('.inline-errors', text: 'blank')
    expect(find('#supplement_number').value).to eq(supplement.number.to_s)
    expect(find('#supplement_title').text).to eq(supplement.title)
    authors = find('#supplement_authors', visible: false).text
    expect(authors).to eq(@author.full_name)
    expect(page).to have_content('test.pdf')
  end
end
