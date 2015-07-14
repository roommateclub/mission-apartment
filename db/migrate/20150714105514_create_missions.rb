class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.integer :client_id, index: true
      t.integer :agent_id, index: true
      t.string :address
      t.string :landlord_phone
      t.string :url
      t.text :note

      t.timestamps null: false
    end
  end
end
