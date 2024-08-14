# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Tenant.destroy_all
User.destroy_all

Tenant.create!(tenant_name: "#{ENV.fetch("TENANT1_NAME")}")
Tenant.create!(tenant_name: "#{ENV.fetch("TENANT2_NAME")}")

User.create!(email: "#{ENV.fetch("TENANT1_USER")}@#{ENV.fetch("TENANT1_NAME").downcase}#{ENV.fetch("SUBROOT_DOMAIN")}#{ENV.fetch("ROOT_DOMAIN")}", 
              name: "#{ENV.fetch("TENANT1_USER")}", 
              password_digest: "#{User.digest(ENV.fetch("TENANT1_USER1_PASSWORD"))}", 
              tenant_name: "#{ENV.fetch("TENANT1_NAME")}")

User.create!(email: "#{ENV.fetch("TENANT2_USER")}@#{ENV.fetch("TENANT2_NAME").downcase}#{ENV.fetch("SUBROOT_DOMAIN")}#{ENV.fetch("ROOT_DOMAIN")}", 
              name: "#{ENV.fetch("TENANT2_USER")}", 
              password_digest: "#{User.digest(ENV.fetch("TENANT2_USER1_PASSWORD"))}", 
              tenant_name: "#{ENV.fetch("TENANT2_NAME")}")
