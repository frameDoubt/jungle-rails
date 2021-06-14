require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validation' do
    it "is valid" do
      product = Product.new(
                    name: 'User_One_Computer',
                    price: 1_234.75,
                    quantity: 10,
                    category: Category.new(name: 'Electronics')
                  )
      expect(product).to be_valid
    end
    it "is not valid without name" do
      product = Product.new(
                    name: nil,
                    price: 1_234.75,
                    quantity: 10,
                    category: Category.new(name: 'Electronics')
                  )
      expect(product).to_not be_valid
    end
    it "is not valid without price" do
      product = Product.new(
                    name: 'User_One_Computer',
                    price: nil,
                    quantity: 10,
                    category: Category.new(name: 'Electronics')
                  )
      expect(product).to_not be_valid
    end
    it "is not valid without quantity" do
      product = Product.new(
                    name: 'User_One_Computer',
                    price: 1_234.75,
                    quantity: nil,
                    category: Category.new(name: 'Electronics')
                  )
      expect(product).to_not be_valid
    end
    it "is not valid without category" do
      product = Product.new(
                    name: 'User_One_Computer',
                    price: 1_234.75,
                    quantity: 10,
                    category: nil
                  )
      expect(product).to_not be_valid
    end
  end
end
