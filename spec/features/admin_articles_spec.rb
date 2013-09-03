require 'spec_helper'

feature 'visiting the articles admin section' do
  scenario 'the user sees a list of articles' do
    article = FactoryGirl.create(:article)
    log_in_admin_user
    visit admin_articles_path

    expect(page).to have_css('tr', text: article.title)
  end
end
