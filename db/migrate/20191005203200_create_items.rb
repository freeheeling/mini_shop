class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :image
      t.string :status
      t.integer :inventory
      t.references :merchant, foreign_key: true

      t.timestamps
    end
  end
end
