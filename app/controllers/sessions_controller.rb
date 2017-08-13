class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(pseudo: params[:pseudo])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Connexion réussie'
    else
      redirect_to new_session_path, notice: 'Pseudo ou mot de passe invalide'
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to new_session_path, notice: 'Déconnexion réussie'
  end
  
end
