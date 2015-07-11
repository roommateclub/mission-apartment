class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :phone
      t.references :user, null: false, index: true

      t.timestamps null: false
    end
  end
end
