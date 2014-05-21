ActiveAdmin.register Volume do
  config.filters = false

  index download_links: false do
    column :number
    column :year
    column 'ISBN', :isbn
    actions
  end

  form do |f|
    f.inputs do
      f.input :number
      f.input :year
      f.input :isbn, label: 'ISBN'
    end

    f.actions
  end

  controller do
    def permitted_params
      params.permit(volume: [:number, :year, :isbn])
    end
  end
end
