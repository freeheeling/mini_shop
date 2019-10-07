require 'rails_helper'

RSpec.describe 'merchants index page', type: :feature do
  it 'can see name of each merchant' do
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

  visit '/merchants'

  expect(page).to have_content(merchant_1.name)
  expect(page).to have_content(merchant_2.name)
  end
end
