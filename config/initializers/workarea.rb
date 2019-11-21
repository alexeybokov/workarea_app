Workarea.configure do |config|
  # Basic site info
  config.site_name = 'Workarea App'

  config.host = {
    'test' => 'www.example.com',
    'development' => 'localhost:3000',
    'production' => 'www.workarea-app.com' # TODO
  }[Rails.env]

  config.email_to = {
    'test'        => "#{config.site_name} <customerservice@example.com>",
    'development' => "#{config.site_name} <customerservice@workarea_app.test>",
    'production'  => "#{config.site_name} <customerservice@workarea-app.com>" # TODO
  }[Rails.env]

  config.email_from =  {
    'test'        => "#{config.site_name} <noreply@example.com>",
    'development' => "#{config.site_name} <noreply@workarea_app.test",
    'production'  => "#{config.site_name} <noreply@workarea-app.com>" # TODO
  }[Rails.env]
end
