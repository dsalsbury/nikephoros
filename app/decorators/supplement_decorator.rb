class SupplementDecorator < ApplicationDecorator
  delegate :number, :title, :pages, :pdf, :pdf_file_name
  decorates_associations :authors

  def author_names
    authors.map { |author| "<span class=nowrap>#{author.full_name}</span>" }.join(', ').html_safe
  end
end
