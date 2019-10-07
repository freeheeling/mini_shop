class Item < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :name,
                        :description,
                        :price,
                        :image,
                        :status,
                        :inventory,
                        :merchant_id
end
