class CommentsController < ApplicationController

  # Display a view to create a comment
  def new
    @comment = Comment.new
  end

  # Create a new comment
  def create
    gossip = Gossip.find(params[:format]).id

    if current_user
      current_user_comment = current_user.id
    else
      current_user_comment = ""
    end

    comment = Comment.new(content: params[:content],
                          gossip_id: gossip,
                          user_id: current_user_comment
                          )

    if comment.save
      flash[:success] = "Le commentaire a été créé avec succès."
      redirect_to gossip_path(gossip)
    else
      flash[:echec] = "Connecte toi pour pouvoir commenter les potins."
      redirect_to gossip_path(gossip)
    end
  end

  def edit
  end

  def update
    @model = Comment.find_by(id: params[:id]) 

    if @model.update(content: params[:content])
      redirect_to gossip_path(Comment.find(params[:id]).gossip_id)  
      flash[:success] = "Le commentaire a été modifié avec succès."
    else
      render gossip_path(params[:id].gossip_id)
      flash[:echec] = "Le commentaire n'a pas été modifié, veuillez essayer à nouveau."
    end
  end

  def destroy
    @comment = Comment.find_by(gossip_id: params[:id])

    if @comment.destroy
      redirect_to gossip_path(params[:id]) 
      flash[:success] = "Le commentaire a bien été supprimé."
    end
  end
end
