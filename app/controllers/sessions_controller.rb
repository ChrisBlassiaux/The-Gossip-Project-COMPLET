class SessionsController < ApplicationController
  def new
  end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    @user = User.find_by(email: params[:email])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      # on va cuisiner le cookie pour l'utilisateur
      if params[:checkbox] == true
        remember(@user)
      end

      redirect_to '/'
      # redirige où tu veux, avec un flash ou pas
      
    else
      flash[:echec] = 'Mot de passe ou/et email invalide(s)'
      render new_session_path
    end
  end

  def destroy
    @user = User.new
    log_out(@user)
    redirect_to '/'
  end
end
