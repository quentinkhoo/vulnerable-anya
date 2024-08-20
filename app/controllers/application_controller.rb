class ApplicationController < ActionController::Base
  include JsonWebToken
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  skip_forgery_protection
  before_action :authenticate_request

  def not_found
    render plain: "404 Not Found", status: :not_found
  end

  def authenticate_request
    header = request.headers["ANYA-ACCESS-TOKEN"]
    token = header.split(" ").last if header
    begin
      decoded = jwt_decode(token)
      @current_user = User.find(decoded[:user_id])
      @current_tenant = Tenant.find(decoded[:tenant_id])
    rescue
      render json: { error: "Invalid token" }, status: :unauthorized
    end
  end
  
end
