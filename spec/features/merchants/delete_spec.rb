require 'rails_helper'

RSpec.describe 'Delete merchant' do
  describe 'as a visitor' do
    describe 'when visiting a merchant show page' do
      it 'can delete merchant' do
        merchant_1 = Merchant.create!(name:    'Beenz',
                                      address: '300 West Main Street',
                                      city:    'Avon',
                                      state:   'CT',
                                      zip:     06001)
        merchant_2 = Merchant.create!(name:    'Kozmo',
                                      address: '80 Broad Street 14th Floor',
                                      city:    'New York',
                                      state:   'NY',
                                      zip:     10004)

        visit "/merchants/#{merchant_1.id}"

        click_link 'Delete merchant'

        expect(current_path).to eq('/merchants')

        expect(page).to_not have_content('Beenz')
        expect(page).to have_content('Kozmo')
      end
    end
  end
end
