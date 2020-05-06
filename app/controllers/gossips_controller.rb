class GossipsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: 5) # avec xxx qui sont les données obtenues à partir du formulaire
  
    if @gossip.save # essaie de sauvegarder en base @gossip
      flash[:success] = "Le gossip a bien été enregisté."
      redirect_to "/"
      # si ça marche, il redirige vers la page d'index du site
    else
      flash[:echec] = "Le gossip n'a pas été sauvegardé, entrées incorrèctes"
      render "/gossips/new"
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


    # modifier en methodes REST
    # static pages
  def contact
  end

  def team
  end

  # dynamic pages
  def welcome
  end

  def gossip
  end

  def page_user

  end
end
