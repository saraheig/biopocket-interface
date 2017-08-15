require 'test_helper'

class SessionTest < ActionDispatch::IntegrationTest
  test 'can sign in as user' do
    get '/session/new'
    assert_response :success
    
    post '/session', params: {
      pseudo: 'YourPseudo',
      password: 'yoursecret'
    }
    
    assert_equal 'Connexion réussie', flash[:notice]
    
    assert_redirected_to '/'
    follow_redirect!
    assert_redirected_to '/tables'
    follow_redirect!
    assert_response :success
  end

  test 'can not sign in as user' do
    get '/session/new'
    assert_response :success
    
    post '/session', params: {
      pseudo: 'WrongPseudo',
      password: 'WrongPassword'
    }
    
    assert_equal 'Pseudo ou mot de passe invalide', flash[:notice]
    
    assert_redirected_to '/session/new'
    follow_redirect!
    assert_response :success
  end
end