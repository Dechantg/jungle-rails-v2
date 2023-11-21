require 'rails_helper'

RSpec.describe UserSpec, type: :model do

  describe 'Validations' do


    it 'User should be entered' do
      user = User.new(name: '', email: 'bob@example.com', password: '1234', password_confirmation: '1234')

      expect(user).to be_valid
    end

    it 'Email should be entered' do
      user = User.new(name: 'Test User', email: '', password: '1234', password_confirmation: '1234')

      expect(user).to be_valid
    end

    it 'Email should be unique' do
      user1 = User.new(name: 'Test User', email: 'test@example.com', password: '1234', password_confirmation: '1234')
      user2 = User.new(name: 'Test User', email: 'test@example.com', password: '1234', password_confirmation: '1234')

      expect(user1).to be_valid
      expect(user2).not_toto be_valid


    end



    it 'User Passwords should match' do
      user = User.new(name: 'Test User', email: 'bob@example.com', password: '1234', password_confirmation: '12345')


      expect(user.password).to eq(user.password_confirmation)
    end

    it 'User Passwords should match' do
      user = User.new(name: 'Test User', email: 'bob@example.com', password: '1234', password_confirmation: '1234')


      expect(user.password).to eq(user.password_confirmation)
    end

    it 'User Passwords should exist' do
      user = User.new(name: 'Test User', email: 'bob@example.com', password: '', password_confirmation: '1235')
      user.valid?


      expect(user.errors[:password]).not_to include("can't be blank")
    end

    it 'User Password Confimation should exist' do
      user = User.new(name: 'Test User', email: 'bob@example.com', password: '1234', password_confirmation: '')


      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end


    it 'User Password should be greater than 8' do
      user = User.new(name: 'Test User', email: 'bob@example.com', password: '1234567', password_confirmation: '1234567')

      user.valid?


      expect(user.password.length).to be >= 8
    end
 

  end

  describe '.authenticate_with_credentials' do

    it 'should return user if credentials are valid' do
      user = User.create(
        name: 'Test User',
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      )

      authenticated_user = User.authenticate_with_credentials('test@example.com', 'password124')

      expect(authenticated_user).to eq(user)
    end

    it 'should return nil if email is not found' do
      user = User.create(
        name: 'Test User',
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
      authenticated_user = User.authenticate_with_credentials('test@example.com', 'password123')

      expect(authenticated_user).to be_nil
    end

    it 'should return nil if password is incorrect' do
      user = User.create(
        name: 'Test User',
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      )

      authenticated_user = User.authenticate_with_credentials('test@example.com', 'password123')

      expect(authenticated_user).to be_nil
    end

    it 'should return user if email has extra spaces' do
      user = User.create(
        name: 'Test User',
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      )

      authenticated_user = User.authenticate_with_credentials('  test@example.com  ', 'password123')

      expect(authenticated_user).to eq(user)
    end

    it 'should return user if email has different case' do
      user = User.create(
        name: 'Test User',
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      )

      authenticated_user = User.authenticate_with_credentials('tEsT@exAmPlE.cOm', 'password123')

      expect(authenticated_user).to eq(user)
    end



  end


end