class ShopsController < ApplicationController
  def new
    party = Party.find(params[:party_id])
    lat = party.station.lat
    lng = party.station.lng
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.save
  end

  def destroy
    @party.destroy
  end

  def shop_params
    params.require(:shop).permit(
      :name,
      :address,
      :lat,
      :lng,
      :budget,
      :budget_memo,
      :catch,
      :access,
      :url,
      :logo_image,
      :photo,
      :open,
      :close,
      :free_drink,
      :free_food,
      :midnight,
      :upvote,
      :downvote,
      :memo,
    )
  end
end
