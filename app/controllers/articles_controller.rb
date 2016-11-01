class ArticlesController < ApplicationController

	def show
		@article = Article.new
		@article.name = "First one"
		redirect_to :action => :new
	end

	def new
		# @article = Article.find(params[:name])
		# @article = Article.find(params[:author])
		# @article = Article.new
	end

	def create
  	end

  	private

    def article_params
      params.require(:article).permit(:name, :author)
    end
end
