ActiveAdmin.register Article, download_links: false do
  config.filters = false

  index do
    column :title
    column :pages
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :volume, collection: volumes
      f.input :authors, collection: authors, input_html: { class: :select2 }
      f.input :title
      f.input :pages
      f.input :pdf, label: 'PDF'
    end

    f.actions
  end

  controller do
    def volumes
      Volume.all.map { |volume| [volume.number, volume.id] }
    end

    def authors
      Author.all.decorate.map { |author| [author.full_name, author.id] }
    end

    helper_method :volumes, :authors

    def permitted_params
      params.permit({ article: [:volume_id, { author_ids: [] }, :title, :pages, :pdf] }, :utf8, :authenticity_token, :commit)
    end
  end
end
