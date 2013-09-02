require 'spec_helper'

feature 'visiting the articles index' do
  scenario 'the user sees a list of articles' do
    article = FactoryGirl.create(:article)
    visit articles_path

    expect(page).to have_css('table.articles tr', text: article.title)
  end

  scenario 'articles are paginated' do
    articles = FactoryGirl.create_list(:article, 2)
    visit articles_path

    expect(page).to have_content(articles.first.title)
    expect(page).not_to have_content(articles.last.title)

    click_on 'Next'

    expect(page).to have_content(articles.last.title)
  end
end
