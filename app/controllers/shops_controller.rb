require 'httpclient'

class ShopsController < ApplicationController
  def new
    party = Party.find(params[:party_id])
    lat = party.station.lat
    lng = party.station.lng

    client = HTTPClient.new
    query = {
      key: ENV['HOTPEPPER_API_KEY'],
      lat: lat,
      lng: lng,
      order: 4,
      format: 'json'
    }
    uri = 'http://webservice.recruit.co.jp/hotpepper/gourmet/v1/'

    res = client.get(uri,query)

    res_h = JSON.parse(res.body,symbolize_names: true)

    res_h[:results][:shop].each do |result|
      shop_h = Shop.column_names.map {|x| [x,result[x]]}.to_h

      print res_h
    end
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
