class ArticlesController < ApplicationController
    def index
        @articles = Article.all
        end
    
    def new 
        @article = Article.new
    end

    def show
        @article = Article.find(params[:id])
        # Assuming you want to find the article by ID, not by name
    end

    def edit
        @article = Article.find(params[:id])
        # Assuming you want to find the article by ID, not by name
    end

    def update
        @article = Article.find(params[:id])
        @article.update(article_params)
        redirect_to article_path(@article)
        # Redirect to the show page of the updated article
    end

    
    def create
        @article = Article.new(article_params)
        @article.save
        redirect_to articles_path
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
        # Redirect to the index page after deletion
    end
    private
    def article_params
        params.require(:article).permit(:name, :description)
    end
end
