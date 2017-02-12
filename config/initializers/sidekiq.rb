require "sidekiq/web"

Sidekiq::Web.use Rack::Auth::Basic do |_, password|
  ActiveSupport::SecurityUtils.secure_compare(password, ENV.fetch("CMS_PASSWORD"))
end
