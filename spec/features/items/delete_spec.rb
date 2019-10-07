require 'rails_helper'

RSpec.describe 'Delete item' do
  describe 'as a visitor' do
    describe 'when visiting an item show page' do
      it 'can delete item' do
        merchant = Merchant.create!(name:    'Oomba',
                                    address: '9840 Irvine Center Drive',
                                    city:    'Irvine',
                                    state:   'CA',
                                    zip:     92618)
        item = Item.create!(name:        'Firefly',
                            description: 'soft-bodied beetle related to the glowworm whose bioluminescence attracts mates or prey',
                            price:       52.80,
                            image:       'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Leuchtk%C3%A4fer_-_Firefly.JPG/440px-Leuchtk%C3%A4fer_-_Firefly.JPG',
                            status:      'active',
                            inventory:   7,
                            merchant_id: merchant.id)

        visit "/items/#{item.id}"

        click_link 'Delete item'

        expect(current_path).to eq('/items')

        expect(page).to_not have_content(item.name)
        expect(page).to_not have_content("Description: #{item.description}")
        expect(page).to_not have_content("Price: #{item.price}")
        expect(page).to_not have_css("img[src='#{item.image}']")
        expect(page).to_not have_content("Status: #{item.status}")
        expect(page).to_not have_content("In stock: #{item.inventory}")
        expect(page).to_not have_content("Seller: #{item.merchant.name}")
      end
    end
  end
end
