module SessionHelper
  # Simulated authentication of a user to fix controllers' tests
  def sign_in_as(name)
    user = users(name)
    post session_url, params: { pseudo: user.pseudo, password: 'yoursecret' }
  end
end