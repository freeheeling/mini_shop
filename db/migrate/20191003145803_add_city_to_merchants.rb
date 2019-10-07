class AddCityToMerchants < ActiveRecord::Migration[5.1]
  def change
    add_column :merchants, :city, :string
  end
end
