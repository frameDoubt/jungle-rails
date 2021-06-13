require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validation' do
    it "is not valid without a name" do
      name = Product.new(name: nil)
      expect(name).to_not be_valid
    end
  end
end
