class ApplicationController < ActionController::Base
  include JsonWebToken
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # API Means don't need CSRF right?
  skip_forgery_protection

  before_action :authenticate_request
  skip_before_action :authenticate_request, only: [ :not_found ]

  def not_found
    render plain: "404 Not Found", status: :not_found
  end

  def set_current_tenant(tenant_id)
    sql = "set app.current_tenant_id to '#{tenant_id}'"
    result = ActiveRecord::Base.connection.execute(sql)
  end

  def authenticate_request
    header = request.headers["ANYA-ACCESS-TOKEN"]
    token = header.split(" ").last if header
    begin
      decoded_token = jwt_decode(token)
      set_current_tenant(decoded_token[:tenant_id])
    rescue Exception => e
      render json: { error: "Invalid token" }, status: :unauthorized
    end
  end
end
