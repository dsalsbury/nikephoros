Kaminari.configure do |config|
  if Rails.env.test?
    config.default_per_page = 1
  else
    config.default_per_page = 15
  end
end
