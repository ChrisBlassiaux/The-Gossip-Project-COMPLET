class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], email: params[:email], age: params[:age], city_id: City.first.id, password: params[:password])

    if @user.save 
      log_in(@user)
      flash[:success] = "Vous êtes inscris."
      redirect_to '/' #sessions_path
    else
      flash[:echec] = "Erreur de champs, veuillez recommencer"
      render new_user_path
    end

  end
end