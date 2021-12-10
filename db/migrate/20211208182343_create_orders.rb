class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.text :shipping_address
      t.float :order_total
      t.boolean :payment_status

      t.timestamps
    end
  end
end
