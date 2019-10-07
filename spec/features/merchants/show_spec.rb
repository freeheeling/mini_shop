require 'rails_helper'

RSpec.describe 'merchants show page', type: :feature do
  it 'can see merchant name, address, city, state, zip' do
    merchant_1 = Merchant.create!(name:    'Oomba',
                                  address: '9840 Irvine Center Drive',
                                  city:    'Irvine',
                                  state:   'CA',
                                  zip:     92618)
    merchant_2 = Merchant.create!(name:    'Kozmo',
                                  address: '80 Broad Street 14th Floor',
                                  city:    'New York',
                                  state:   'NY',
                                  zip:     10004)

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content("Address: #{merchant_1.address}")
    expect(page).to have_content("City: #{merchant_1.city}")
    expect(page).to have_content("State: #{merchant_1.state}")
    expect(page).to have_content("Zip: #{merchant_1.zip}")
  end
end
