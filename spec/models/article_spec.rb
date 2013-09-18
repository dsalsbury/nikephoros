require 'spec_helper'

describe Article do
  it { should belong_to(:volume) }
  it { should have_many(:authorships) }
  it { should have_many(:authors).through(:authorships) }
  it { should have_many(:taggings) }
  it { should have_many(:keywords).through(:taggings) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:volume) }
  it { should allow_value('').for(:pages) }
  it { should allow_value('1').for(:pages) }
  it { should allow_value('1-10').for(:pages) }
  it { should allow_value('1 - 10').for(:pages) }
  it { should allow_value('1,10').for(:pages) }
  it { should allow_value('1, 10').for(:pages) }
  it { should allow_value('1,10-20').for(:pages) }
  it { should allow_value('1-10,20').for(:pages) }
  it { should_not allow_value('123x').for(:pages) }
  it { should_not allow_value('1-').for(:pages) }

  describe '#split_pages' do
    it 'splits two numbers separated by a hyphen' do
      pages_input = '1-10'
      article = FactoryGirl.build(:article, pages: pages_input)

      article.save

      expect(article.first_page).to eql(1)
      expect(article.other_pages).to eql('-10')
    end

    it 'strips out spaces surrounding the hyphen' do
      pages_input = '1 - 10'
      article = FactoryGirl.build(:article, pages: pages_input)

      article.save

      expect(article.first_page).to eql(1)
      expect(article.other_pages).to eql('-10')
    end

    it 'splits two numbers separated by a comma' do
      pages_input = '1,10'
      article = FactoryGirl.build(:article, pages: pages_input)

      article.save

      expect(article.first_page).to eql(1)
      expect(article.other_pages).to eql(',10')
    end
  end
end
