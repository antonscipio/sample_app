# add password digest to the users db table

class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    # below (ass password digest column to the users table
    add_column :users, :password_digest, :string
  end
end
