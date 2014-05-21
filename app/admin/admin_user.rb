ActiveAdmin.register AdminUser, as: 'User', download_links: false do
  config.filters = false

  index do
    column :email
    column :last_sign_in_at
    column :sign_in_count
    actions
  end

  form do |f|
    f.inputs 'User' do
      f.input :email
      f.input :password
      f.input :password_confirmation, required: true
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit(user: [:email, :password, :password_confirmation])
    end
  end
end
