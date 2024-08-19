class CreateUsers < ActiveRecord::Migration[7.2]
  enable_extension "uuid-ossp"

  def change
    create_table :tenants, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.string :name, null: false, default: ""

      t.timestamps
    end

    create_table :users, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.string :email, null: false, default: ""
      t.string :name, null: false, default: ""
      t.string :password_digest, null: false, default: ""
      t.references :tenant, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
