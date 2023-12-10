class AddProviderUuidToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :fullname, :string
    add_column :users, :avatar_url, :string
  end
end
