require 'rails_helper'

RSpec.describe 'create merchant page' do
  describe 'as a visitor' do
    describe 'when visiting new merchant form to create new merchant' do
      it 'creates a new merchant' do
        visit '/merchants'

        click_link 'Create new merchant'

        expect(current_path).to eq('/merchants/new')

        fill_in 'Name', with: 'Beenz'
        fill_in 'Address', with: '300 West Main Street'
        fill_in 'City', with: 'Avon'
        fill_in 'State', with: 'CT'
        fill_in 'Zip', with: '06001'

        click_button 'Create new merchant'

        expect(current_path).to eq('/merchants')
        expect(page).to have_content('Beenz')
      end
    end
  end
end
