require 'rails_helper'

RSpec.describe 'update item' do
  describe 'as a visitor' do
    describe 'when visiting an item show page' do
      it 'can update the item' do
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

        click_link 'Update item'

        expect(current_path).to eq("/items/#{item.id}/edit")

        fill_in 'Name', with: 'Firefly'
        fill_in 'Description', with: 'soft-bodied beetle related to the glowworm whose bioluminescence attracts mates or prey'
        fill_in 'Price', with: 55.44
        fill_in 'Image', with: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Leuchtk%C3%A4fer_-_Firefly.JPG/440px-Leuchtk%C3%A4fer_-_Firefly.JPG'
        fill_in 'Inventory', with: 10

        click_button 'Update item'

        expect(current_path).to eq ("/items/#{item.id}")

        expect(page).to have_content('Firefly')
        expect(page).to have_content('soft-bodied beetle related to the glowworm whose bioluminescence attracts mates or prey')
        expect(page).to have_content(55.44)
        expect(page).to have_css("img[src='https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Leuchtk%C3%A4fer_-_Firefly.JPG/440px-Leuchtk%C3%A4fer_-_Firefly.JPG']")
        expect(page).to have_content('active')
        expect(page).to have_content(10)
        expect(page).to have_content("#{item.merchant.name}")
      end
    end
  end
end
