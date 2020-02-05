class PagesController < ApplicationController
  def home
    @items = Resource.seeds
  end

  def search
    @items = Resource.search(params[:q])

    respond_to do |format|
      format.js
    end
  end
end
