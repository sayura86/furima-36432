class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :postal_code,       null: false
      t.integer :ship_from_id,    null: false
      t.string :city,              null: false
      t.string :block,             null: false
      t.string :building
      t.string :phone_number,      null: false
      t.references :purchase_info, null: false, foreign_key: true

      t.timestamps
    end
  end
end
