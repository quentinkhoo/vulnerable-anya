class Tenant2::TokenController < Tenant2Controller
  skip_before_action :authenticate_request, only: [ :create ]

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = jwt_encode(user_id: user.id, tenant_id: user.tenant_id)
      render json: { token: token }, status: :ok
    else
      render json: { error: "Invalid credentials" }, status: :unauthorized
    end
  end
end
