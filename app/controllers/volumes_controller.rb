class VolumesController < ApplicationController
  respond_to :html

  def index
    @volumes = Volume.order('number DESC').decorate
  end

  def show
    @search = Volume.find(params[:id]).articles.includes(:volume, :authors).search(params[:q])
    @articles = @search.result.sort_by_volume_number_and_first_page.page(params[:page]).decorate

    respond_to do |format|
      format.html
      format.json { render json: { table: render_to_string(partial: 'article_list', layout: false, formats: [:html]) } }
    end
  end
end
