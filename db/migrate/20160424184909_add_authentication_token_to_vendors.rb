class AddAuthenticationTokenToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :authentication_token, :string
  end
end