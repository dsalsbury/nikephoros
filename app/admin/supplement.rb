ActiveAdmin.register Supplement do
  decorate_with SupplementDecorator
  config.filters = false

  index download_links: false do
    column :title
    column :pages
    actions
  end

  form partial: 'form'

  show title: :title do |supplement|
    attributes_table do
      row :number
      row :title
      row :author_names
      row :pages
      row :description
      row(Supplement.human_attribute_name(:pdf)) { supplement.pdf_download_link }
    end
  end

  controller do
    def authors
      Author.all.decorate.map { |author| [author.full_name, author.id] }
    end

    def current_author_ids
      @supplement.authors.pluck(:id)
    end

    def form_action
      @supplement.persisted? ? [:admin, @supplement] : [:admin, :supplements]
    end

    helper_method :volumes, :authors, :current_volume_id, :current_author_ids, :keyword_names, :keywords, :form_action

    def permitted_params
      params.permit(supplement: [{ author_ids: [] }, :number, :title, :pages, :description, :pdf, :pdf_cache, :id])
    end
  end
end
