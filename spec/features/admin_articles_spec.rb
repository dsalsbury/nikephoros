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
  let(:article) { FactoryGirl.build_stubbed(:article) }

  before(:each) do
    @volume = FactoryGirl.create(:volume)
    @author = FactoryGirl.create(:author).decorate

    log_in_admin_user
    visit new_admin_article_path
  end

  scenario 'the user adds a new article and is redirected to the show page' do
    select @volume.number, from: 'Volume'
    select2 @author.full_name, from: 'Authors'
    fill_in 'Title', with: article.title
    fill_in 'Pages', with: article.pages
    attach_file 'PDF', File.join(Rails.root, 'spec', 'support', 'test.pdf')
    click_on 'Create Article'

    expect(current_path).to eql(admin_article_path(Article.last))
    expect(page).to have_content('Article was successfully created')
    expect(Article.count).to eql(1)
  end

  scenario 'the user adds an article with a keyword that already exists' do
    keyword = FactoryGirl.create(:keyword)

    select @volume.number, from: 'Volume'
    fill_in 'Title', with: article.title
    select2 keyword.name, from: 'Keywords'
    click_on 'Create Article'

    expect(page).to have_css('tr', text: keyword.name)
  end

  scenario "the user adds an article with a keyword that doesn't already exist" do
    new_keyword = 'newthing'

    select @volume.number, from: 'Volume'
    fill_in 'Title', with: article.title
    select2 new_keyword, from: 'Keywords'
    click_on 'Create Article'

    expect(page).to have_css('tr', text: new_keyword)
  end

  scenario "the user adds an article with multiple keywords that don't already exist" do
    new_keyword = 'newthing'
    new_keyword2 = 'somethingelse'

    select @volume.number, from: 'Volume'
    fill_in 'Title', with: article.title
    select2 new_keyword, from: 'Keywords'
    select2 new_keyword2, from: 'Keywords'
    click_on 'Create Article'

    expect(page).to have_css('tr', text: new_keyword)
    expect(page).to have_css('tr', text: new_keyword2)
  end

  scenario 'validation fails and attributes remain set', :js do
    keyword = FactoryGirl.create(:keyword)
    new_keyword = 'newthing'

    select @volume.number, from: 'Volume'
    fill_in 'Title', with: article.title
    fill_in 'Pages', with: 'not a page number'
    select2 keyword.name, from: 'Keywords'
    select2 new_keyword, from: 'Keywords'
    attach_file 'PDF', File.join(Rails.root, 'spec', 'support', 'test.pdf')
    click_on 'Create Article'

    expect(current_path).to eq(admin_articles_path)
    expect(page).to have_css('.inline-errors', text: 'must be a series of page numbers')
    expect(find('#article_volume').text).to eq(@volume.number.to_s)
    expect(find('#article_title').text).to eq(article.title)
    keywords = find('#article_keyword_names', visible: false).value
    expect(keywords).to eq("#{keyword.name},#{new_keyword}")
    expect(page).to have_content('test.pdf')
  end
end
