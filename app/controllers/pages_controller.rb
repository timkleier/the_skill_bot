class PagesController < ApplicationController
  before_action :track_ahoy

  def home
    @items = search_resources
    @items_count = Resource.count
  end

  def search
    @items = search_resources

    respond_to do |format|
      format.js
    end
  end

  private

  def search_resources
    Resource.search(params[:q], params[:p])
  end

  def track_ahoy
    ahoy.track params[:action], q: params[:q] ? params[:q] : nil
  end

end
