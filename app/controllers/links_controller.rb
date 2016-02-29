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
      flash.now[:error] = @link.errors.full_messages.join(' ')
      render :index
    end
  end

  private

  def link_params
    params.require(:new_link).permit(:url, :title)
  end
end
