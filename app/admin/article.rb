ActiveAdmin.register Article, download_links: false do
  config.filters = false

  index do
    column :title
    column :pages
    default_actions
  end
end
