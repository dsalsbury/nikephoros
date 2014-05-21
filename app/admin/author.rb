ActiveAdmin.register Author do
  decorate_with AuthorDecorator
  config.filters = false

  index download_links: false do
    column :full_name
    actions
  end

  form do |f|
    f.inputs do
      f.input :prefix
      f.input :first_name
      f.input :middle_name
      f.input :last_name
      f.input :suffix
      f.input :display_as
    end

    f.actions
  end

  show title: :full_name do
    attributes_table do
      row :prefix
      row :first_name
      row :middle_name
      row :last_name
      row :suffix
      row :display_as
    end
  end

  controller do
    def permitted_params
      params.permit(author: [:prefix, :first_name, :middle_name, :last_name, :suffix, :display_as])
    end
  end
end
