# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Order.destroy_all
GiftCard.destroy_all
Supplier.destroy_all

User.destroy_all
Tenant.destroy_all

# Create Tenant1 Data
tenant1 = Tenant.create!(name: "#{ENV.fetch("TENANT1_NAME")}")

# Create Tenant1 Users
tenant1_user1 = User.create!(
    email: "#{ENV.fetch("TENANT1_USER1")}@#{ENV.fetch("TENANT1_NAME")}".downcase,
    name: "#{ENV.fetch("TENANT1_USER1")}",
    password_digest: "#{User.digest(ENV.fetch("TENANT1_USER1_PASSWORD"))}",
    tenant_id: tenant1.id
)
tenant1_user2 = User.create!(
    email: "#{ENV.fetch("TENANT1_USER2")}@#{ENV.fetch("TENANT1_NAME")}".downcase,
    name: "#{ENV.fetch("TENANT1_USER2")}",
    password_digest: "#{User.digest(ENV.fetch("TENANT1_USER2_PASSWORD"))}",
    tenant_id: tenant1.id
)
tenant1_user3 = User.create!(
    email: "#{ENV.fetch("TENANT1_USER3")}@#{ENV.fetch("TENANT1_NAME")}".downcase,
    name: "#{ENV.fetch("TENANT1_USER3")}",
    password_digest: "#{User.digest(ENV.fetch("TENANT1_USER3_PASSWORD"))}",
    tenant_id: tenant1.id
)
tenant1_user4 = User.create!(
    email: "#{ENV.fetch("TENANT1_USER4")}@#{ENV.fetch("TENANT1_NAME")}".downcase,
    name: "#{ENV.fetch("TENANT1_USER4")}",
    password_digest: "#{User.digest(ENV.fetch("TENANT1_USER4_PASSWORD"))}",
    tenant_id: tenant1.id
)

# Create Tenant2 Data
tenant2 = Tenant.create!(name: "#{ENV.fetch("TENANT2_NAME")}")
tenant2_user1 = User.create!(
    email: "#{ENV.fetch("TENANT2_USER1")}@#{ENV.fetch("TENANT2_NAME")}".downcase,
    name: "#{ENV.fetch("TENANT2_USER1")}",
    password_digest: "#{User.digest(ENV.fetch("TENANT2_USER1_PASSWORD"))}",
    tenant_id: tenant2.id
)
tenant2_user2 = User.create!(
    email: "#{ENV.fetch("TENANT2_USER2")}@#{ENV.fetch("TENANT2_NAME")}".downcase,
    name: "#{ENV.fetch("TENANT2_USER2")}",
    password_digest: "#{User.digest(ENV.fetch("TENANT2_USER2_PASSWORD"))}",
    tenant_id: tenant2.id
)
tenant2_user3 = User.create!(
    email: "#{ENV.fetch("TENANT2_USER3")}@#{ENV.fetch("TENANT2_NAME")}".downcase,
    name: "#{ENV.fetch("TENANT2_USER3")}",
    password_digest: "#{User.digest(ENV.fetch("TENANT2_USER3_PASSWORD"))}",
    tenant_id: tenant2.id
)

# Create Supplier Data
supplier1 = Supplier.create!(name: "treeple")
supplier2 = Supplier.create!(name: "stood_up")
supplier3 = Supplier.create!(name: "married")

# Create GiftCard Data
giftcard1 = GiftCard.create!(
    name: "Spy X Family",
    description: "Waku waku",
    url: "https://spy-x-family.fandom.com/",
    supplier_id: supplier1.id,
    tenant_name_id: tenant1.id
)

giftcard2 = GiftCard.create!(
    name: "Oshi No Ko",
    description: "Who murdered Ai Hoshino?",
    url: "https://www.reddit.com/r/OshiNoKo/",
    supplier_id: supplier1.id,
    tenant_name_id: tenant2.id
)

giftcard3 = GiftCard.create!(
    name: "Pokemon",
    description: "Ash Ketchum is still 10 years old",
    url: "https://pokemon.com/",
    supplier_id: supplier2.id,
    tenant_name_id: tenant1.id
)

giftcard4 = GiftCard.create!(
    name: "Doraemon",
    description: "How does Doraemon hear if he does not have ears?",
    url: "https://dora-world.com/",
    supplier_id: supplier1.id,
    tenant_name_id: tenant1.id
)

giftcard5 = GiftCard.create!(
    name: "Sousou no Frieren",
    description: "Where can I find Frieren merchandise?",
    url: "https://frieren-anime.jp/",
    supplier_id: supplier3.id,
    tenant_name_id: tenant2.id
)

giftcard6 = GiftCard.create!(
    name: "Zero kara Hajimaru Isekai Seikatsu",
    description: "Rem ga daisuki",
    url: "https://rezero.fandom.com/wiki/Re:Zero_kara_Hajimeru_Isekai_Seikatsu_(anime)",
    supplier_id: supplier3.id,
    tenant_name_id: tenant1.id
)

giftcard7 = GiftCard.create!(
    name: "Mushoku Tensei",
    description: "Rimuru uWu",
    url: "https://tensura.fandom.com/wiki/Anime",
    supplier_id: supplier2.id,
    tenant_name_id: tenant1.id
)

giftcard8 = GiftCard.create!(
    name: "Migi to Dali",
    description: "Did you know migi means right in Japanese and dali is short for hidari, which means left in Japanese?",
    url: "https://myanimelist.net/anime/50586/Migi_to_Dali",
    supplier_id: supplier1.id,
    tenant_name_id: tenant2.id
)

# Create Order Data
order1 = Order.create!(
    user_id: tenant1_user1.id,
    gift_card_id: giftcard1.id
)

order2 = Order.create!(
    user_id: tenant1_user1.id,
    gift_card_id: giftcard3.id
)

order3 = Order.create!(
    user_id: tenant2_user1.id,
    gift_card_id: giftcard2.id
)

order4 = Order.create!(
    user_id: tenant1_user2.id,
    gift_card_id: giftcard6.id
)

order5 = Order.create!(
    user_id: tenant1_user2.id,
    gift_card_id: giftcard7.id
)

order6 = Order.create!(
    user_id: tenant2_user1.id,
    gift_card_id: giftcard2.id
)

order7 = Order.create!(
    user_id: tenant2_user2.id,
    gift_card_id: giftcard5.id
)

order8 = Order.create!(
    user_id: tenant1_user1.id,
    gift_card_id: giftcard4.id
)

order9 = Order.create!(
    user_id: tenant1_user3.id,
    gift_card_id: giftcard1.id
)

order10 = Order.create!(
    user_id: tenant2_user2.id,
    gift_card_id: giftcard8.id
)

# ENABLE ROW LEVEL SECURITY
user_rsql = """ ALTER TABLE users ENABLE ROW LEVEL SECURITY;
          ALTER TABLE users FORCE ROW LEVEL SECURITY;
          CREATE POLICY tenant_isolation_policy ON users USING (tenant_id = current_setting('app.current_tenant_id')::UUID);
      """
ActiveRecord::Base.connection.execute(user_rsql)
