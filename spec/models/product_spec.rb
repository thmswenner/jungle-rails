require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:all) do
    @category = Category.new(name: 'furniture')
    @category.save
  end

  def newProduct(id, name, description, price, quantity)
    Product.new(
      id: id,
      name: name,
      description: description,
      price: price,
      quantity: quantity
    )
  end

  describe 'Validations' do
    it 'is not valid without a name' do
      @product = newProduct(@category.id, nil, 'Cool', 30, 2)
      @product.save
      expect(@product).to_not be_valid
    end

    it 'is not valid without a description' do
      @product = newProduct(@category.id, nil, 'Cool', 30, 2)
      @product.save
      expect(@product).to_not be_valid
    end

    it 'is not valid without a price' do
      @product = newProduct(@category.id, 'Couch', 'Cool', nil, 2)
      @product.save
      expect(@product).to_not be_valid
    end

    it 'is not valid without a quantity' do
      @product = newProduct(@category.id, 'Couch', 'Cool', 30, nil)
      @product.save

      expect(@product).to_not be_valid
    end
  end
end
