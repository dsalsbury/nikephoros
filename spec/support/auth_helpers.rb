module AuthHelpers
  def log_in_admin_user(user = FactoryGirl.create(:admin_user))
    page.set_rack_session('warden.user.admin_user.key' => AdminUser.serialize_into_session(user).unshift('AdminUser'))
  end
end

RSpec.configure { |config| config.include(AuthHelpers) }
