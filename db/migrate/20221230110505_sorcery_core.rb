class SorceryCore < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username,         null: false, limit: 255
      t.string :email,            null: false, index: { unique: true }
      t.string :crypted_password
      t.string :salt
      t.string :avatar
      t.integer :birthplace_code
      t.integer :living_place_code
      t.integer :role,            null: false, default: 0

      t.timestamps                null: false
    end
  end
end
