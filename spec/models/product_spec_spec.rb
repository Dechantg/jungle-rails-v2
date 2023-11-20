require 'rails_helper'

RSpec.describe ProductSpec, type: :model do

  describe 'Validations' do
    it 'is valid with all 4 attributes and a category' do
      category = Category.create(name: 'test category')
      product = Product.new(name: 'test product', price: 7999, quantity: 10, category: category)
      expect(product).to be_valid
    end

    it 'is not valid without a name' do
      category = Category.create(name: 'test category')
      product = Product.new(name: nil, price: 7999, quantity: 10, category: category)
      product.valid?
      expect(product.errors.full_messages).to include("Name can't be blank")

    end

    it 'is not valid without a price' do
      category = Category.create(name: 'test category')
      product = Product.new(name: 'test product', price: '', quantity: 10, category: category)
      product.valid?

      puts product.errors.full_messages


      expect(product.errors.full_messages).to include("Price can't be blank")

    end

    it 'is not valid without a quantity' do
      category = Category.create(name: 'test category')
      product = Product.new(name: 'test product', price: 7999, quantity: nil, category: category)
      product.valid?

      expect(product.errors.full_messages).to include("Quantity can't be blank")

    end

    it 'is not valid without a category' do
      category = Category.create(name: 'test category')
      product = Product.new(name: 'test product', price: 7999, quantity: 10, category: nil)
      product.valid?

      expect(product.errors.full_messages).to include("Category can't be blank")

    end

  end
end
