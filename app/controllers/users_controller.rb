class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to tables_url, notice: 'Enregistrement effectué avec succès'
        else
            render :new
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:firstname, :lastname, :pseudo, :email, :password)
    end
end