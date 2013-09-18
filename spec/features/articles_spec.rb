require 'spec_helper'

feature 'visiting the articles index' do
  scenario 'the user sees a list of articles' do
    article = FactoryGirl.create(:article)
    visit articles_path

    expect(page).to have_css('table.articles tr', text: article.title)
  end

  scenario 'articles are paginated' do
    Article.paginates_per(1)
    article1 = FactoryGirl.create(:article, pages: '1')
    article2 = FactoryGirl.create(:article, pages: '2')
    visit articles_path

    expect(page).to have_content(article1.title)
    expect(page).to have_no_content(article2.title)

    click_on 'Next'

    expect(page).to have_content(article2.title)
  end
end
