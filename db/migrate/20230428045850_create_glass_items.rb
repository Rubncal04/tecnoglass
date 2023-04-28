class CreateGlassItems < ActiveRecord::Migration[7.0]
  def change
    create_table :glass_items do |t|
      t.references :order, null: false, foreign_key: true
      t.string :item_sequential_num, null: false, index: { unique: true }
      t.float :width
      t.float :height

      t.timestamps
    end
  end
end
