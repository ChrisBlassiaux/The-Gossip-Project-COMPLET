class CommentsController < ApplicationController

  # Display a view to create a comment
  def new
    @comment = Comment.new(gossip: "", user: User.last, content: "")
  end

  # Create a new comment
  def create
    gossip = Gossip.find(params[:format]).id

    comment = Comment.new(gossip_id: gossip,
                          user: User.last,
                          content: params[:content])

    if comment.save
      flash[:success] = "Le commentaire a été créé avec succès."
      redirect_to gossip_path(gossip)
    else
      redirect_to gossip_path(gossip)
    end
  end
end
