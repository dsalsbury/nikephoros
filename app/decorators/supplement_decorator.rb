class SupplementDecorator < ApplicationDecorator
  delegate :number, :title, :pages, :description, :pdf, :pdf_cache
  decorates_associations :authors

  def author_names
    authors.map { |author| "<span class=nowrap>#{author.full_name}</span>" }.join(', ').html_safe
  end

  def pdf_download_link
    h.link_to('Download', pdf.url) if pdf
  end
end
