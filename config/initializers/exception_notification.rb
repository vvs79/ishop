if Rails.env == "production" || Rails.env == "staging" || Rails.env == "development"

  exceptions = []
  exceptions << 'ActiveRecord::RecordNotFound'
  exceptions << 'AbstractController::ActionNotFound'
  exceptions << 'ActionController::RoutingError'
  exceptions << 'ActionController::InvalidAuthenticityToken'

  server_name = case Rails.env
    when "production"     then "ishop.com"
    when "staging"        then "staging.ishop.com"
    when "development"    then "DEVELOPMENT ishop"
    else
      "unknown env ishop"
  end

  Rails.application.config.middleware.use ExceptionNotification::Rack,
      email: {
        email_prefix:   "[#{server_name} error] ",
        sender_address: "error500@ishop.com",
        exception_recipients: ["vidoc1979@gmail.com"]
      },
      ignore_exceptions: exceptions

end
  