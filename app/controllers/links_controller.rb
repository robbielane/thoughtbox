class LinksController < ApplicationController
  before_action :authenticate!

  def index
    @links = current_user.links
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      flash.now[:notice] = "Successfully added #{@link.title}"
      redirect_to links_path
    else
      flash[:error] = @link.errors.full_messages.join(' ')
      redirect_to links_path
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash.now[:notice] = "Successfully updated #{@link.title}"
      redirect_to links_path
    else
      flash[:error] = @link.errors.full_messages.join(' ')
      render :edit
    end
  end

  def destroy
    @link = Link.find(params[:id]).destroy
    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end
end
