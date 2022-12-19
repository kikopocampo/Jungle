require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    
    it 'is valid with valid attributes' do
      @category = Category.new(name: "Evergreens")
      @product = Product.new(
        name: "Monstera",
        price: 10000,
        category: @category,
        quantity: 10
      )
      expect(@product).to be_valid
    end

    it 'should be invalid if name is nil' do
      @category = Category.new(name: "Evergreens")
      @product = Product.new(
        name: nil,
        price: 10000,
        category: @category,
        quantity: 10
      )
      @product.save
      @error = @product.errors.full_messages
      expect(@error[0]).to eq("Name can't be blank")
      expect(@product).to_not be_valid
    end

    it 'should be invalid if price is not a number' do
      @category = Category.new(name: "Evergreens")
      @product = Product.new(
        name: "Monstera",
        price: 'One hundred',
        category: @category,
        quantity: 10
      )
      @product.save
      @error = @product.errors.full_messages
      expect(@error[0]).to eq("Price is not a number")
      expect(@product).to_not be_valid
    end

    it 'should be invalid if category is nil' do
      @category = Category.new(name: "Evergreens")
      @product = Product.new(
        name: "Monstera",
        price: 1000,
        category: nil,
        quantity: 10
      )
      @product.save
      @error = @product.errors.full_messages
      expect(@error[0]).to eq("Category must exist")
      expect(@product).to_not be_valid
    end

    it 'should be invalid if quantity is nil' do
      @category = Category.new(name: "Evergreens")
      @product = Product.new(
        name: "Monstera",
        price: 1000,
        category: @category,
        quantity: nil
      )
      @product.save
      @error = @product.errors.full_messages
      expect(@error[0]).to eq("Quantity can't be blank")
      expect(@product).to_not be_valid
    end
  
  end
end
