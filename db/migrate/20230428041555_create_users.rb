class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :user_name, null: false, index: { unique: true }
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest

      t.timestamps
    end
  end
end
