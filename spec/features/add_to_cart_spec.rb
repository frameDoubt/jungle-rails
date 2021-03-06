require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see My Cart content increase" do
    # ACT
    visit root_path
    find('.btn-primary', match: :first).click
    # DEBUG / VERIFY
    save_screenshot 'add_to_cart.png'
    expect(page).to have_content ' My Cart (1) '
  end
end