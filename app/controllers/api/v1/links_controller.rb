class Api::V1::LinksController < Api::V1::BaseController
  # def update
  #   @link = Link.find(params[:id])
  #   respond_with @link.update(link_params)
  # end

  def toggle_read
    @link = Link.find(params[:id])
    respond_with @link.toggle
  end

  private

  def link_params
    params.permit(:url, :title, :read)
  end
end
