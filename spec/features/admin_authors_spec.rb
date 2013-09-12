require 'spec_helper'

feature 'visiting the authors admin section' do
  scenario 'the user sees a list of authors' do
    author = FactoryGirl.create(:author)
    log_in_admin_user
    visit admin_authors_path

    expect(page).to have_css('tr', text: author.decorate.full_name)
  end
end

feature 'adding a new author' do
  scenario 'the user adds a new author and is redirected to the show page' do
    author = FactoryGirl.build_stubbed(:author)

    log_in_admin_user
    visit new_admin_author_path

    fill_in 'Prefix', with: author.prefix
    fill_in 'First name', with: author.first_name
    fill_in 'Middle name', with: author.middle_name
    fill_in 'Last name', with: author.last_name
    fill_in 'Suffix', with: author.suffix
    fill_in 'Display as', with: author.display_as

    click_on 'Create Author'

    expect(current_path).to eql(admin_author_path(Author.last))
    expect(page).to have_content('Author was successfully created')
    expect(Author.count).to eql(1)
  end
end
