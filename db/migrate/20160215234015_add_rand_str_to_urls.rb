class AddRandStrToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :randstr, :string
  end
end
