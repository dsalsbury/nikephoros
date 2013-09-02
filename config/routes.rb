Nikephoros::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/', controller: 'high_voltage/pages', action: :show, id: 'home'
end
