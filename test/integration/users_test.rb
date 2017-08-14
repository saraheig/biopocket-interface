require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest
  test 'can sign up as new user' do
    get '/session/new'
    
    assert_response :success
    assert_select 'a', 'Pas encore de compte ? S\'enregistrer'

    post '/users', params: {
      user: {
        firstname: 'Toto',
        lastname: 'Tutu',
        email: 'tototutu@gmail.com',
        pseudo: 'tototutu',
        password: 'tototutu'
      }
    }
    
    assert_redirected_to '/'
    follow_redirect!
    assert_redirected_to '/tables'
    follow_redirect!
    assert_response :success
    
    assert_equal 'Enregistrement effectué avec succès', flash[:notice]
  end
end