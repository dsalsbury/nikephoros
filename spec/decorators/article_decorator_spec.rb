require 'spec_helper'

describe ArticleDecorator do
  describe '#pages' do
    it 'combines the first_page and other_pages fields' do
      article = FactoryGirl.build_stubbed(:article, first_page: '1', other_pages: '-20')

      expect(article.decorate.pages).to eql('1-20')
    end

    it 'handles articles that only have a first_page' do
      article = FactoryGirl.build_stubbed(:article, first_page: '1', other_pages: nil)

      expect(article.decorate.pages).to eql('1')
    end

    it "handles articles that don't have any pages" do
      article = FactoryGirl.build_stubbed(:article, first_page: nil, other_pages: nil)

      expect(article.decorate.pages).to eql('')
    end
  end
end
