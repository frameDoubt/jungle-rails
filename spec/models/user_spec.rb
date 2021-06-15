require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    it "is valid" do
      user = User.new(
                    first_name: 'User_One_Computer',
                    last_name: 1_234.75,
                    email: 10,
                    password: 'password',
                    password_confirmation: 'password'
                  )
      expect(product).to be_valid
    end
  end
end
