require 'spec_helper'

feature 'searching for articles by title', :js do
  let!(:search_term) { 'Gargoyle' }
  let!(:article) { FactoryGirl.create(:article, title: search_term) }
  let!(:other_article) { FactoryGirl.create(:article) }

  before(:each) do
    visit articles_path
    click_on 'Search'
  end

  scenario 'user only sees articles whose title contains the search term' do
    fill_in 'Title', with: search_term

    tbody = page.find('tbody')
    expect(tbody).to have_content(search_term)
    expect(tbody).not_to have_content(other_article.title)
  end

  scenario 'user only sees articles whose title contains one of the search terms' do
    search_term2 = 'apricot'

    fill_in 'Title', with: "#{search_term} #{search_term2}"

    tbody = page.find('tbody')
    expect(tbody).not_to have_content(other_article.title)
    expect(tbody).to have_content(search_term)
  end
end

feature 'searching for articles by author', :js do
  scenario 'user only sees articles by the chosen author' do
    author = FactoryGirl.create(:author)
    article = FactoryGirl.create(:article)
    other_article = FactoryGirl.create(:article)
    author.articles << article

    visit articles_path
    click_on 'Search'
    select2 author.last_name, from: 'Authors'

    tbody = page.find('tbody')
    expect(tbody).to have_content(article.title)
    expect(tbody).to have_no_content(other_article.title)
  end
end

feature 'searching for articles by date', :js do
  scenario 'user only sees articles for the chosen year' do
    volume = FactoryGirl.create(:volume, year: 2000)
    other_volume = FactoryGirl.create(:volume, year: 2010)
    article = FactoryGirl.create(:article, volume: volume)
    other_article = FactoryGirl.create(:article, volume: other_volume)

    visit articles_path
    click_on 'Search'
    fill_in 'Year', with: volume.year.to_s

    tbody = page.find('tbody')
    expect(tbody).to have_content(article.title)
    expect(tbody).to have_no_content(other_article.title)
  end
end

feature 'searching for articles by keyword', :js do
  scenario 'user only sees articles with the chosen keyword' do
    article = FactoryGirl.create(:article)
    other_article = FactoryGirl.create(:article)
    keyword = FactoryGirl.create(:keyword)
    article.keywords << keyword

    visit articles_path
    click_on 'Search'
    select2 keyword.name, from: 'Keywords'

    tbody = page.find('tbody')
    expect(tbody).to have_content(article.title)
    expect(tbody).to have_no_content(other_article.title)
  end
end
