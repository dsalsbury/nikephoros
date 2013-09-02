Nikephoros::Application.routes.draw do
  get '/', controller: 'high_voltage/pages', action: :show, id: 'home'
end
