class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    # add email index to users table
    add_index :users, :email, unique: true
  end
end
