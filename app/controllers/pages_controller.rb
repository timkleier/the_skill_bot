class PagesController < ApplicationController
  before_action :track_ahoy

  def home
    @items = Resource.search(params[:q])
  end

  def search
    @items = Resource.search(params[:q])

    respond_to do |format|
      format.js
    end
  end

  private

  def track_ahoy
    ahoy.track params[:action], q: params[:q] ? params[:q] : nil
  end

end
