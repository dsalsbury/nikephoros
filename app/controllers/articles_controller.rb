class ArticlesController < ApplicationController
  respond_to :html

  def index
    @search = Article.includes(:volume, :authors).search(params[:q])
    @articles = @search.result.sort_by_volume_number_and_first_page.page(params[:page]).decorate

    respond_to do |format|
      format.html
      format.json { render json: { table: render_to_string(partial: 'article_list', layout: false, formats: [:html]) } }
    end
  end

  def show
      @article = Article.find(params[:id]).decorate
  end

  def authors
    Author.all.decorate.map { |author| [author.full_name, author.id] }
  end

  def keywords
    Keyword.pluck(:name)
  end
  helper_method :authors, :keywords
end
