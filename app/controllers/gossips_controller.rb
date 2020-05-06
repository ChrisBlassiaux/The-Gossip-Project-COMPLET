class GossipsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: User.first.id)

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
  end

  def destroy
  end


    # VOIR Où mettre les methodes ci-dessous 
  def contact
  end

  def team
  end

  def welcome
  end

end
