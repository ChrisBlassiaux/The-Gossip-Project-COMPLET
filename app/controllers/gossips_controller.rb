class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def show
  end

  def new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: User.first.id)

    if @gossip.save 
      flash[:success] = "Le gossip a bien été enregisté."
      redirect_to "/" #redirect_back
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
      redirect_to "/" #redirect_back
    end
  end


    # VOIR Où mettre les methodes ci-dessous 
  def contact
  end

  def team
  end

  def welcome
  end

end
