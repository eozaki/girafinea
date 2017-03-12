class AddColumnUidToUser < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string, null: false, uniq: true
  end
end
