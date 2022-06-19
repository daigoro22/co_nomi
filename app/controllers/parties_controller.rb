class PartiesController < ApplicationController
  def index
    @parties = Party.all
  end

  def edit
  end

  def new
    @party = Party.new
  end
end
