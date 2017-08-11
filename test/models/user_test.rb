require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end
  
  test 'ensures that firstname length is less than 15' do
    user = User.new(firstname: 'Lorem ipsum dol.', lastname: @user.lastname, pseudo: 'titolino', email: 'tutu@toto.com', password: @user.password_digest)
    assert_not user.valid?
    assert_equal [:firstname], user.errors.keys
  end
  
  test 'ensures that lastname length is less than 15' do
    user = User.new(firstname: @user.firstname, lastname: 'Lorem ipsum dol.', pseudo: 'titolino', email: 'tutu@toto.com', password: @user.password_digest)
    assert_not user.valid?
    assert_equal [:lastname], user.errors.keys
  end
  
  test 'ensures that email exists' do
    user = User.new(firstname: @user.firstname, lastname: @user.lastname, pseudo: 'titolino', email: nil, password: @user.password_digest)
    assert_not user.valid?
    assert_equal [:email], user.errors.keys
  end
  
  test 'ensures that email is unique' do
    user = User.new(firstname: @user.firstname, lastname: @user.lastname, pseudo: 'titolino', email: @user.email, password: @user.password_digest)
    assert_not user.valid?
    assert_equal [:email], user.errors.keys
  end
  
  test 'ensures that pseudo is unique' do
    user = User.new(firstname: @user.firstname, lastname: @user.lastname, pseudo: @user.pseudo, email: 'tutu@toto.com', password: @user.password_digest)
    assert_not user.valid?
    assert_equal [:pseudo], user.errors.keys
  end
  
  test 'ensures that the pseudo length is minimumn 5' do
    user = User.new(firstname: @user.firstname, lastname: @user.lastname, pseudo: '1234', email: 'tutu@toto.com', password: @user.password_digest)
    assert_not user.valid?
    assert_equal [:pseudo], user.errors.keys
  end
  
  test 'ensures that the pseudo length is maximum 15' do
    user = User.new(firstname: @user.firstname, lastname: @user.lastname, pseudo: '12345678910123456', email: 'tutu@toto.com', password: @user.password_digest)
    assert_not user.valid?
    assert_equal [:pseudo], user.errors.keys
  end
  
  test 'ensures that the password length is minimumn 5' do
    user = User.new(firstname: @user.firstname, lastname: @user.lastname, pseudo: 'titolino', email: 'tutu@toto.com', password: '1234')
    assert_not user.valid?
    assert_equal [:password], user.errors.keys
  end
  
end
