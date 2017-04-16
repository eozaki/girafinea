class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :quantity
      t.string :title
      t.string :description
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
