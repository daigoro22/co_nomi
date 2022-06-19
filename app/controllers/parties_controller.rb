class PartiesController < ApplicationController
  def index
    @parties = Party.all
  end

  def edit
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
    if @party.save
      redirect_to parties_url, notice: "飲み会「#{@party.name}」を登録しました"
    else
      render :new
    end
  end

  private

  def party_params
    params.require(:party).permit(:name, :date)
  end
end
