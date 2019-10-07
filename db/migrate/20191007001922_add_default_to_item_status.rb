class AddDefaultToItemStatus < ActiveRecord::Migration[5.1]
  def change
    change_column_default :items, :status, 'active'
  end
end
