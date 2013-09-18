ActiveAdmin.register Article do
  decorate_with ArticleDecorator
  config.filters = false

  index download_links: false do
    column :title
    column :pages
    default_actions
  end

  form partial: 'form'

  show title: :page_title do |article|
    attributes_table do
      row :volume
      row :author_names
      row :title
      row :pages
      row :keyword_list, label: Article.human_attribute_name(:keywords)
      row(Article.human_attribute_name(:pdf)) { article.pdf_download_link }
    end
  end

  controller do
    def volumes
      Volume.all.map { |volume| [volume.number, volume.id] }
    end

    def authors
      Author.all.decorate.map { |author| [author.full_name, author.id] }
    end

    def current_volume_id
      @article.volume_id
    end

    def current_author_ids
      @article.authors.pluck(:id)
    end

    def keyword_names
      @article.keyword_names
    end

    def keywords
      Keyword.pluck(:name)
    end

    def form_action
      @article.persisted? ? [:admin, @article] : [:admin, :articles]
    end

    helper_method :volumes, :authors, :current_volume_id, :current_author_ids, :keyword_names, :keywords, :form_action

    def permitted_params
      params.permit({ article: [:volume_id, { author_ids: [] }, :title, :pages, :keyword_names, :pdf, :id] })
    end
  end
end
