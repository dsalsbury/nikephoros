class ArticleDecorator < ApplicationDecorator
  delegate :title, :keywords, :pdf, :volume_id, :pdf_file_name
  decorates_associations :volume, :authors

  def author_names
    authors.map { |author| "<span class=nowrap>#{author.full_name}</span>" }.join(', ').html_safe
  end

  def keyword_list
    keywords.pluck(:name).join(', ')
  end

  def pdf_download_link
    h.link_to('Download', pdf.url) if pdf_file_name
  end
end
