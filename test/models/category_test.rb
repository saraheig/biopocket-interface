require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  setup do
    @category = categories(:one)
  end
  
  test 'ensures that title exists' do
    category = Category.new(title: nil)
    assert_not category.valid? # category.valid? must return false -> assert_not used
    assert_equal [:title], category.errors.keys
  end
  
  test 'ensures that title length is less than 50' do
    category = Category.new(title: 'Lorem ipsum dolor sit amet, consectetur cras ametz.')
    assert_not category.valid?
    assert_equal [:title], category.errors.keys
  end
  
  test 'ensures that title is unique' do
    category = Category.new(title: @category.title)
    assert_not category.valid?
    assert_equal [:title], category.errors.keys
  end
end
