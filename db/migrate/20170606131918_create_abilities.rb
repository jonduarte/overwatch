class CreateAbilities < ActiveRecord::Migration[5.1]
  def change
    create_table :abilities do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.boolean :is_ultimate, null: false
      t.string :api_id, null: false
      t.references :hero, foreign_key: true

      t.timestamps
    end
  end
end
