class SetCurrentTenant
  def initialize(app)
    @app = app
  end

  def call(env)
    # Set a dummy UUID first to avoid errors
    ActiveRecord::Base.connection.execute("set app.current_tenant_id to '#{SecureRandom.uuid}'")
    @app.call(env)
  end
end
