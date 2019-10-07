class AddZipToMerchants < ActiveRecord::Migration[5.1]
  def change
    add_column :merchants, :zip, :integer
  end
end
