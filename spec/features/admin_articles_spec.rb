require 'spec_helper'

feature 'visiting the articles admin section' do
  scenario 'the user sees a list of articles' do
    article = FactoryGirl.create(:article)
    log_in_admin_user
    visit admin_articles_path

    expect(page).to have_css('tr', text: article.title)
  end
end

feature 'adding a new article', :js do
  scenario 'the user adds a new article and is redirected to the show page' do
    volume = FactoryGirl.create(:volume)
    author = FactoryGirl.create(:author).decorate
    article = FactoryGirl.build_stubbed(:article)

    log_in_admin_user
    visit new_admin_article_path

    select volume.number, from: 'Volume'
    select2(author.full_name, from: 'Authors')
    fill_in 'Title', with: article.title
    fill_in 'Pages', with: article.pages
    attach_file 'PDF', File.join(Rails.root, 'spec', 'support', 'test.pdf')
    click_on 'Create Article'

    expect(current_path).to eql(admin_article_path(Article.last))
    expect(page).to have_content('Article was successfully created')
    expect(Article.count).to eql(1)
  end
end
