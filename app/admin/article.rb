ActiveAdmin.register Article, download_links: false do
  config.filters = false

  index do
    column :title
    column :date
    column :pages
    default_actions
  end
end
