class ArticleDecorator < ApplicationDecorator
  delegate :title, :pages
  decorates_associations :volume, :authors

  def author_names
    authors.map { |author| "<span class=nowrap>#{author.full_name}</span>" }.join(', ').html_safe
  end
end
