class AddColumnNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, null: false
    change_column :users, :email, :string, null: false
  end
end
