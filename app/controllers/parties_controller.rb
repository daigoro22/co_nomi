class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :edit, :update, :destroy]
  
  def index
    @parties = Party.all
  end

  def edit
  end

  def update
    @party.update!(party_params)
    redirect_to parties_url, notice: "飲み会「#{@party.name}」を更新しました"
  end

  def new
    @party = Party.new
    @party.build_station
  end

  def create # TODO: 同じ駅の情報でもStation のデータベースが増えてしまうので、駅名+路線のハッシュをPKにする
    @party = Party.new(party_params)
    if @party.save
      redirect_to parties_url, notice: "飲み会「#{@party.name}」を登録しました"
    else
      render :new
    end
  end

  def destroy
    @party.destroy
    redirect_to parties_url, notice: "飲み会「#{@party.name}」を削除しました"
  end

  private

  def party_params
    params.require(:party).permit(:name, :date, station_attributes: [:name, :lat, :lng])
  end

  def set_party
    @party = Party.find(params[:id]) # TODO: 現在ログインしているユーザの飲み会のみ表示できるようにする
  end
end
