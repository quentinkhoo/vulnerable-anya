class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def not_found
    render plain: "404 Not Found", status: :not_found
  end

  def log_subdomain
    Rails.logger.info "Current subdomain: #{request.subdomain}"
  end

  private

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
