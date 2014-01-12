class SupplementsController < ApplicationController
  respond_to :html

  def index
    @supplements = Supplement.includes(:authors).page(params[:page]).decorate
  end
end
