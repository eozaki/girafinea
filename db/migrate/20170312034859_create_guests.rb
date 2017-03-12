class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :email
      t.string :name

      t.timestamps null: false
    end
  end
end
