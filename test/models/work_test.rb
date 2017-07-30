require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  setup do
    @work = works(:one)
  end
  
  test 'ensures that title exists' do
    work = Work.new(title: nil, topic: @work.topic, category: @work.category, house: @work.house, time: @work.time, difficulty: @work.difficulty)
    assert_not work.valid?
    assert_equal [:title], work.errors.keys
  end
  
  test 'ensures that title length is less than 50' do
    work = Work.new(title: 'Lorem ipsum dolor sit amet, consectetur cras ametz.', topic: @work.topic, category: @work.category, house: @work.house, time: @work.time, difficulty: @work.difficulty)
    assert_not work.valid?
    assert_equal [:title], work.errors.keys
  end
  
  test 'ensures that title is unique' do
    work = Work.new(title: @work.title, topic: @work.topic, category: @work.category, house: @work.house, time: @work.time, difficulty: @work.difficulty)
    assert_not work.valid?
    assert_equal [:title], work.errors.keys
  end
  
  test 'ensures that description length is less than 250' do
    work = Work.new(description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec metus quam, blandit eu erat in, placerat vulputate elit. Curabitur molestie mauris vel risus interdum pellentesque. Ut egestas massa vitae facilisis laoreet. Vivamus hendrerit laoreet sedd.', title: 'NewTitle', topic: @work.topic, category: @work.category, house: @work.house, time: @work.time, difficulty: @work.difficulty)
    assert_not work.valid?
    assert_equal [:description], work.errors.keys
  end
  
  test 'ensures that impact length is less than 250' do
    work = Work.new(impact: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec metus quam, blandit eu erat in, placerat vulputate elit. Curabitur molestie mauris vel risus interdum pellentesque. Ut egestas massa vitae facilisis laoreet. Vivamus hendrerit laoreet sedd.', title: 'NewTitle', topic: @work.topic, category: @work.category, house: @work.house, time: @work.time, difficulty: @work.difficulty)
    assert_not work.valid?
    assert_equal [:impact], work.errors.keys
  end
  
  #house note: There is never a case where a boolean will be anything but true, false or nil, because ActiveRecord will type-cast the input value to true, false or nil. 
  test 'ensures that house exists' do
    work = Work.new(house: nil, title: 'NewTitle', topic: @work.topic, category: @work.category, time: @work.time, difficulty: @work.difficulty)
    assert_not work.valid?
    assert_equal [:house], work.errors.keys
  end
  
  test 'ensures that the cost format is correct (regex)' do
    work = Work.new(cost: 9.99, title: 'NewTitle', topic: @work.topic, category: @work.category, house: @work.house, time: @work.time, difficulty: @work.difficulty)
    assert_not work.valid?
    assert_equal [:cost], work.errors.keys
  end
  
  test 'ensures that the time length is minimumn 2' do
    work = Work.new(time: '1', title: 'NewTitle', topic: @work.topic, category: @work.category, house: @work.house, difficulty: @work.difficulty)
    assert_not work.valid?
    assert_equal [:time], work.errors.keys
  end
  
  test 'ensures that the time length is maximum 15' do
    work = Work.new(time: '1234567890123456', title: 'NewTitle', topic: @work.topic, category: @work.category, house: @work.house, difficulty: @work.difficulty)
    assert_not work.valid?
    assert_equal [:time], work.errors.keys
  end
  
  test 'ensures that the difficulty value is correct' do
    work = Work.new(difficulty: '4', title: 'NewTitle', topic: @work.topic, category: @work.category, house: @work.house, time: @work.time)
    assert_not work.valid?
    assert_equal [:difficulty], work.errors.keys
  end

end
