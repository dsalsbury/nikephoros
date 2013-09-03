require 'spec_helper'

feature 'visiting the articles index' do
  scenario 'the user sees a list of articles' do
    article = FactoryGirl.create(:article)
    visit articles_path

    expect(page).to have_css('table.articles tr', text: article.title)
  end
end
