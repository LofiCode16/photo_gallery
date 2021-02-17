class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to photo_path(params[:comment][:photo_id]), notice: 'comentario añadido'
    else
      redirect_to photo_path(params[:comment][:photo_id]), alert: 'no se pudo guardar el comentario'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to root_path, notice: 'comentario eliminado'
  end

  private
  def comment_params
    params.require(:comment),permit(:content, :photo_id)
  end
end
