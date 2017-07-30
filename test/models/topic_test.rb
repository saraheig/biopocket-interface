require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  
  test 'ensures that title exists' do
    topic = Topic.new(title: nil)
    assert_not topic.valid?
    assert_equal [:title], topic.errors.keys
  end
  
  test 'ensures that title length is less than 50' do
    topic = Topic.new(title: 'Lorem ipsum dolor sit amet, consectetur cras ametz.')
    assert_not topic.valid?
    assert_equal [:title], topic.errors.keys
  end
  
  test 'ensures that title is unique' do
    topic = Topic.new(title: 'FirstTitle')
    assert_not topic.valid?
    assert_equal [:title], topic.errors.keys
  end
  
  test 'ensures that description length is less than 250' do
    topic = Topic.new(title: 'MyNewTitle', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec metus quam, blandit eu erat in, placerat vulputate elit. Curabitur molestie mauris vel risus interdum pellentesque. Ut egestas massa vitae facilisis laoreet. Vivamus hendrerit laoreet sedd.')
    assert_not topic.valid?
    assert_equal [:description], topic.errors.keys
  end
  
end
