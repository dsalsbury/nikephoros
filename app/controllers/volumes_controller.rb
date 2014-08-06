class VolumesController < ApplicationController
  respond_to :html

  def index
    @volumes = Volume.order('number DESC').decorate
  end

  def show
    @articles = Volume.find(params[:id]).articles.decorate
  end
end
