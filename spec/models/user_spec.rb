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
    it "is not valid without a unique email, not case sensitive" do
      @user.save
      @user2 = User.new(
        first_name: 'User',
        last_name: 'One',
        email: 'emailone@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user2).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    before :each do
      @user = User.new(
        first_name: 'User',
        last_name: 'One',
        email: 'emailOne@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end
    it 'expect not to be not be nil' do
      @user.save
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to_not be(nil)
    end
    it 'expect to be nil, with wrong password' do
      @user.save
      @user2 = User.new(
        first_name: 'User',
        last_name: 'One',
        email: 'emailOne@email.com',
        password: 'not_password',
        password_confirmation: 'not_password'
      )
      expect(User.authenticate_with_credentials(@user.email, @user2.password)).to be(nil)
    end
    it 'expect to be nil, with wrong email' do
      @user.save
      @user2 = User.new(
        first_name: 'User',
        last_name: 'One',
        email: 'emailTwo@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(User.authenticate_with_credentials(@user2.email, @user.password)).to be(nil)
    end
    it 'expect not to be nil, with correct email and extra spaces' do
      @user.save
      @user2 = User.new(
        first_name: 'User',
        last_name: 'One',
        email: '   emailOne@email.com ',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(User.authenticate_with_credentials(@user2.email, @user.password)).to_not be(nil)
    end
    it 'expect not to be nil, with correct email and different letter case' do
      @user.save
      @user2 = User.new(
        first_name: 'User',
        last_name: 'One',
        email: '   emailone@email.com ',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(User.authenticate_with_credentials(@user2.email, @user.password)).to_not be(nil)
    end
  end
end
