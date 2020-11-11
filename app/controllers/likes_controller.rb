class LikesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def create
    @like = Lile.create(user_id: current_user.id, item_id: params[:item_id])
  end
  

  def destroy
    like = Lile.find_by(user_id: current_user.id, item_id: params[:item_id])
    like.destroy
  end

  private

  def set_post
    @item = Item.find(params[:item_id])
  end
end

