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
end
