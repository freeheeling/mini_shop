class AddStateToMerchants < ActiveRecord::Migration[5.1]
  def change
    add_column :merchants, :state, :string
  end
end
