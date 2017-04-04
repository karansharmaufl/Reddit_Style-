class LinksController < ApplicationController
  before_filter :authenticate_user!, except: [:index,:show]
  def index
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = current_user.links.build
  end

  def create
    @link = current_user.links.build(links_params)
    if @link.save
      flash[:notice]= "Success"
      redirect_to(links_path)
    else
      render('new')
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(links_params)
      redirect_to(link_path)
    else
      render('edit')
    end
  end

  def delete
    @link = Link.find(params[:id])
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to(links_path)
  end

  def upvote
    @link = Link.find(params[:id])
    @link.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @link = Link.find(params[:id])
    @link.downvote_by current_user
    redirect_to :back
  end

  def links_params
    params.require(:link).permit(:title,:url)
    end

end
