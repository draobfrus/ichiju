class CreateUserMisosoupBases < ActiveRecord::Migration[7.0]
  def change
    create_table :user_misosoup_bases do |t|
      t.references :user, null: false, foreign_key: true
      t.references :misosoup_base, null: false, foreign_key: true

      t.timestamps
    end
    add_index :user_misosoup_bases, %i(user_id misosoup_base_id), unique: true
  end
end
