# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Tenant.destroy_all

# Create Tenant1 Data
tenant1 = Tenant.create!(name: "#{ENV.fetch("TENANT1_NAME")}")

# Create Tenant1 Users
User.create!(
    email: "#{ENV.fetch("TENANT1_USER1")}@#{ENV.fetch("TENANT1_NAME")}".downcase,
    name: "#{ENV.fetch("TENANT1_USER1")}",
    password_digest: "#{User.digest(ENV.fetch("TENANT1_USER1_PASSWORD"))}",
    tenant_id: tenant1.id
)
User.create!(
    email: "#{ENV.fetch("TENANT1_USER2")}@#{ENV.fetch("TENANT1_NAME")}".downcase,
    name: "#{ENV.fetch("TENANT1_USER2")}",
    password_digest: "#{User.digest(ENV.fetch("TENANT1_USER2_PASSWORD"))}",
    tenant_id: tenant1.id
)
User.create!(
    email: "#{ENV.fetch("TENANT1_USER3")}@#{ENV.fetch("TENANT1_NAME")}".downcase,
    name: "#{ENV.fetch("TENANT1_USER3")}",
    password_digest: "#{User.digest(ENV.fetch("TENANT1_USER3_PASSWORD"))}",
    tenant_id: tenant1.id
)
User.create!(
    email: "#{ENV.fetch("TENANT1_USER4")}@#{ENV.fetch("TENANT1_NAME")}".downcase,
    name: "#{ENV.fetch("TENANT1_USER4")}",
    password_digest: "#{User.digest(ENV.fetch("TENANT1_USER4_PASSWORD"))}",
    tenant_id: tenant1.id
)

# Create Tenant2 Data
tenant2 = Tenant.create!(name: "#{ENV.fetch("TENANT2_NAME")}")
User.create!(
    email: "#{ENV.fetch("TENANT2_USER1")}@#{ENV.fetch("TENANT2_NAME")}".downcase,
    name: "#{ENV.fetch("TENANT2_USER1")}",
    password_digest: "#{User.digest(ENV.fetch("TENANT2_USER1_PASSWORD"))}",
    tenant_id: tenant2.id
)
User.create!(
    email: "#{ENV.fetch("TENANT2_USER2")}@#{ENV.fetch("TENANT2_NAME")}".downcase,
    name: "#{ENV.fetch("TENANT2_USER2")}",
    password_digest: "#{User.digest(ENV.fetch("TENANT2_USER2_PASSWORD"))}",
    tenant_id: tenant2.id
)
User.create!(
    email: "#{ENV.fetch("TENANT2_USER3")}@#{ENV.fetch("TENANT2_NAME")}".downcase,
    name: "#{ENV.fetch("TENANT2_USER3")}",
    password_digest: "#{User.digest(ENV.fetch("TENANT2_USER3_PASSWORD"))}",
    tenant_id: tenant2.id
)

# ENABLE ROW LEVEL SECURITY
sql = """ ALTER TABLE users ENABLE ROW LEVEL SECURITY;
          ALTER TABLE users FORCE ROW LEVEL SECURITY;
          CREATE POLICY tenant_isolation_policy ON users USING (tenant_id = current_setting('app.current_tenant_id')::UUID);
      """
ActiveRecord::Base.connection.execute(sql)
