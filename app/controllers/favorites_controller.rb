class FavoritesController < ApplicationController
  before_action :require_login
  before_action :find_a_favorite, only: :destroy

  def index
  	@favorites = Favorite.all
  end

  def destroy
  	@favorite.destroy
  	redirect_to favorites_path
  end

  private 
  def find_a_favorite
  	@favorite = Favorite.find(params[:id])
  end
end
