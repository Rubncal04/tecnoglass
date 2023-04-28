class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :num_order, null: false, index: { unique: true }
      t.references :customer, null: false, foreign_key: true
      t.datetime :order_date
      t.string :status, null: false

      t.timestamps
    end
  end
end
