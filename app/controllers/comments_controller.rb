class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
  end

  def show
  end


  def edit
  end

  def create

    @link = Link.find(params[:link_id])
    @comment = @link.comments.new(comment_params)
    @comment.user == current_user

      if @comment.save
         redirect_to(@link)
      else
        render('new')
      end
  end

  def destroy
    @comment.destroy
    redirect_to(:back)
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:link_id, :body, :user_id)
    end
end
