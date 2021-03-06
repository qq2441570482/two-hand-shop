Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # config.action_mailer.default_options = {from: 'qq2441570482@gmail.com'}
  # config.action_mailer.default_url_options = { host: "http://localhost:3000" }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: "maimaimai.herokuapp.com" }
  config.action_mailer.smtp_settings = {
      # :address => "smtp.mailgun.org",
      # :port => "587",
      # :domain => "maimaimai.herokuapp.com",
      # :authentication => "plain",
      # :user_name => "postmaster@appecfa142100d14c589dfc01eb1120c29a.mailgun.org",
      # :password => "83b1cacb59f32de57f63a88c703c03d3",
      # :enable_starttls_auto => true
    :port           => ENV['MAILGUN_SMTP_PORT'],
    :address        => ENV['MAILGUN_SMTP_SERVER'],
    :user_name      => ENV['MAILGUN_SMTP_LOGIN'],
    :password       => ENV['MAILGUN_SMTP_PASSWORD'],
    :domain         => 'maimaimai.herokuapp.com',
    :authentication => :plain,
  }
end
