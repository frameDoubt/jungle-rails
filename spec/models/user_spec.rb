require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    before :each do
      @user = User.new(
        first_name: 'User',
        last_name: 'One',
        email: 'emailOne@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end
                
    it "is valid" do
      expect(@user).to be_valid
    end
    it "is not valid without a password" do
      @user.password = nil
      expect(@user).to_not be_valid
    end
    it "is not valid without a password_confirmation" do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end
    it "is not valid without a first_name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end
    it "is not valid without a last_name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
    it "is not valid without a email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end
    it "is not valid without a unique email" do
      @user.save!
      @user2 = User.new(
        first_name: 'User',
        last_name: 'One',
        email: 'emailOne@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user2).to_not be_valid
    end
  end
end
