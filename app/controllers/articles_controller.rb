class ArticlesController < ApplicationController

	def show
		@article = Article.new
	end

	def new
		@article = Article.new		
	end
end
