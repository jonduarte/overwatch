class CreateHeros < ActiveRecord::Migration[5.1]
  def change
    create_table :heros do |t|
      t.string :name, null: false
      t.string :real_name, null: false
      t.integer :health, null: false
      t.integer :armour, null: false
      t.integer :shield, null: false
      t.integer :api_id, null: false

      t.timestamps
    end
  end
end
