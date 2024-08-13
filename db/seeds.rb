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

Tenant.create!(tenant_name: 'Forger-Family')
Tenant.create!(tenant_name: 'Desmond-Family')

User.create!(email: 'anya@forger.com', 
              name: 'Anya', 
              password_digest: "#{User.digest(ENV.fetch("ANYA_FORGER_PASSWORD"))}", 
              tenant_name: 'Forger-Family')

User.create!(email: 'damian@forger.com', 
              name: 'Damian', 
              password_digest: "#{User.digest(ENV.fetch("DAMIAN_DESMOND_PASSWORD"))}", 
              tenant_name: 'Desmond-Family')
