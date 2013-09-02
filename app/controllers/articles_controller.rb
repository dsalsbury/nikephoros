class ArticlesController < ApplicationController
  respond_to :html

  def index
    @articles = Article.page(params[:page])
    respond_with(@articles)
  end
end
