require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'is not valid without matching passwords' do
      @user = User.new(password: 'abcde', password_confirmation: 'fghij')
      @user.save
      expect(@user).to_not be_valid
    end


    it 'is not valid without a password' do
      @user = User.new(password: nil)
      @user.save
      expect(@user).to_not be_valid
    end


    it 'is not valid with less then 5 characters' do
      @user = User.new(password: 'a')
      @user.save
      expect(@user).to_not be_valid
    end


    it 'should have a unique email' do
      @user = User.new(
        password: 'abcde',
        password_confirmation: 'abcde',
        email: 'TOM@gmail.com'
      )

      @user.save

      @user2 = User.new(
        password: 'abcde',
        password_confirmation: 'abcde',
        email: 'tom@gmail.com'
      )

      expect(@user2).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    
    it 'should not log in if password does not match database' do
      @user = User.new(
        password: 'abcde',
        password_confirmation: 'abcde',
        email: 'tom@gmail.com'
      )
      @user.save
      p @user
      @singIn = User.authenticate_with_credentials 'tom@gmail.com', 'fghijk'

      expect(@signIn).to be_valid
    end  
  end
end
