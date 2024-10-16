class CreateSupplierGiftcardOrders < ActiveRecord::Migration[7.2]
  def change

    create_table :suppliers, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.string :name, null: false, default: ""

      t.timestamps
    end

    create_table :gift_cards, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.string :name, null: false, default: ""
      t.string :description, null: false, default: ""
      t.string :url, null: false, default: ""
      t.references :supplier, type: :uuid, foreign_key: true
      t.references :tenant_name, type: :uuid, foreign_key: {to_table: :tenants}

      t.timestamps
    end

    create_table :orders, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.references :user, type: :uuid, foreign_key: true
      t.references :gift_card, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
