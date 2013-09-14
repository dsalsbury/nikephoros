class ArticlesController < ApplicationController
  respond_to :html

  def index
    @articles = Article.includes(:volume).page(params[:page]).decorate
    respond_with(@articles)
  end
end
