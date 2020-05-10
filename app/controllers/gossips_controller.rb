class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:create, :new]
  before_action :gossip_user, only: [:edit, :update, :destroy]

  def index
    @gossips = Gossip.all
  end

  def show
 
  end

  def new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: current_user.id)

    if @gossip.save 
      flash[:success] = "Le gossip a bien été enregisté."
      redirect_to "/" 
    else
      flash[:echec] = "Le gossip n'a pas été sauvegardé, entrées incorrèctes"
      render "/gossips/new"
    end
  end

  def edit
  end

  def update
    @model = Gossip.find(params[:id])
    if @model.update(title: params[:title], content: params[:content])
      redirect_to @model
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    if @gossip.destroy
      redirect_to "/" 
      flash[:success] = "Le gossip a bien été supprimé."
    end
  end

    # Page qui ne concernent pas totalement le gossips_controller
  def contact
  end

  def team
  end

  def welcome
  end

  private 

  def authenticate_user
    unless current_user
      flash[:echec] = "Connecte toi avant de lâcher ton potin !"
      redirect_to new_session_path
    end
  end

  def gossip_user
    @gossip = Gossip.find(params[:id])
    if @gossip.user_id != current_user.id
      flash[:echec] = "Tu ne peux pas modifier ou supprimer potin !"
      redirect_to '/'
    end
  end

end
