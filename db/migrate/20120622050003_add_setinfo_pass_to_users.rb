class AddSetinfoPassToUsers < ActiveRecord::Migration
  def change
    add_column :users, :setinfo_pass, :string
  end
end
