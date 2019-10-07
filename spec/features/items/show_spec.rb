require 'rails_helper'

RSpec.describe 'items show page', type: :feature do
  it 'can see item name, status, price, description, image, inventory, seller' do
    merchant_1 = Merchant.create!(name:    'Oomba',
                                  address: '9840 Irvine Center Drive',
                                  city:    'Irvine',
                                  state:   'CA',
                                  zip:     92618)
    item_1 = Item.create!(name:        'Firefly',
                          description: 'a soft-bodied beetle related to the glowworm',
                          price:       52.80,
                          image:       'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Leuchtk%C3%A4fer_-_Firefly.JPG/440px-Leuchtk%C3%A4fer_-_Firefly.JPG',
                          status:      'active',
                          inventory:   7,
                          merchant_id: merchant_1.id)

    visit "/items/#{item_1.id}"

    expect(page).to have_content(item_1.name)
    expect(page).to have_content("Description: #{item_1.description}")
    expect(page).to have_content("Price: #{item_1.price}")
    expect(page).to have_css("img[src='#{item_1.image}']")
    expect(page).to have_content("Status: #{item_1.status}")
    expect(page).to have_content("In stock: #{item_1.inventory}")
    expect(page).to have_content("Seller: #{item_1.merchant.name}")
  end
end

# As a visitor
# When I visit an Item Show page
# Then I see a link to update that Item
# When I click the link
# I am taken to '/items/:id/edit'
#  where I see a form to edit the item's data including:
# - name
# - price
# - description
# - image
# - inventory
# When I click the button to submit the form
# Then a `PATCH` request is sent to '/items/:id',
# the item's data is updated,
# and I am redirected to the Item Show page
# where I see the Item's updated information
