require 'rails_helper'

RSpec.describe 'items index page', type: :feature do
  it 'can see name, description, price, image, status, inventory, seller' do
    merchant_1 = Merchant.create!(name:    'Oomba',
                                  address: '9840 Irvine Center Drive',
                                  city:    'Irvine',
                                  state:   'CA',
                                  zip:     92618)
    item_1 = Item.create!(name:        'Firefly',
                          description: 'soft-bodied beetle related to the glowworm whose bioluminescence attracts mates or prey',
                          price:       52.80,
                          image:       'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Leuchtk%C3%A4fer_-_Firefly.JPG/440px-Leuchtk%C3%A4fer_-_Firefly.JPG',
                          status:      'active',
                          inventory:   7,
                          merchant_id: merchant_1.id)
    item_2 = Item.create!(name:        'Foxfire',
                          description: 'fungi found in decaying wood that emits phosphorescent light',
                          price:       16.09,
                          image:       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/PanellusStipticusAug12_2009.jpg/440px-PanellusStipticusAug12_2009.jpg',
                          status:      'active',
                          inventory:   12,
                          merchant_id: merchant_1.id)

    visit 'items/'

    expect(page).to have_content(item_1.name)
    expect(page).to have_content("Description: #{item_1.description}")
    expect(page).to have_content("Price: #{item_1.price}")
    expect(page).to have_css("img[src='#{item_1.image}']")
    expect(page).to have_content("Status: #{item_1.status}")
    expect(page).to have_content("In stock: #{item_1.inventory}")
    expect(page).to have_content("Seller: #{item_1.merchant.name}")

    expect(page).to have_content(item_2.name)
    expect(page).to have_content("Description: #{item_2.description}")
    expect(page).to have_content("Price: #{item_2.price}")
    expect(page).to have_css("img[src='#{item_2.image}']")
    expect(page).to have_content("Status: #{item_2.status}")
    expect(page).to have_content("In stock: #{item_2.inventory}")
    expect(page).to have_content("Seller: #{item_2.merchant.name}")
  end
end
