class RemoveConstraints < ActiveRecord::Migration
  def change
    change_column :users, :hashed_password, :string, null: true
  end
end
