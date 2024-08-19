class ApplicationController < ActionController::Base
  include JsonWebToken
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  skip_forgery_protection
  #before_action :authenticate_request

  def not_found
    render plain: "404 Not Found", status: :not_found
  end

  def log_subdomain
    Rails.logger.info "Current subdomain: #{request.subdomain}"
  end

  private

  def authenticate_request
    header = request.headers["ANYA-ACCESS-TOKEN"]
    token = header.split(" ").last if header
    decoded = jwt_decode(token)
    @current_user = User.find(decoded[:user_id])
    @current_tenant = Tenant.find(decoded[:tenant_id])
  end

  def restrict_access
    if !allowed_routes.include?(request.path)
      render plain: "404 Not Found", status: :not_found
    end
  end

  def allowed_routes
    [
      tenant1_root,
      tenant1_login,
      tenant1_logout
    ]
  end
end
