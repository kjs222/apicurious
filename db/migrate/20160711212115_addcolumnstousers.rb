class Addcolumnstousers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :token, :string
    add_column :users, :nickname, :string
    remove_column :users, :provider
  end
end
