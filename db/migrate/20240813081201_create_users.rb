class CreateUsers < ActiveRecord::Migration[7.2]

  enable_extension "uuid-ossp"

  def change
    create_table :tenants, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.string :name

      t.timestamps
    end

    create_table :users, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.references :tenant, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
