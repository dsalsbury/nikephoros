module ApplicationHelper
  def pdf_field(builder, record)
    existing_filename = nil

    if record.pdf_cache
      existing_filename = record.pdf_cache.split('/').last
    elsif record.pdf.file
      existing_filename = record.pdf.file.filename
    end

    str = builder.input(:pdf, label: 'PDF', required: false)

    if existing_filename
      existing_input = content_tag(:li, class: :input) do
        label = content_tag :label, 'Existing PDF', class: :label, for: 'article_existing_pdf'
        label + existing_filename
      end

      str << existing_input
    end

    str << builder.input(:pdf_cache, as: :hidden)
    str.html_safe
  end
end
