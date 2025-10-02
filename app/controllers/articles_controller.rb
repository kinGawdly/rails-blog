class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :categories_ids, only: [:create]

    def index
        @articles = Article.all
        end
    
    def new 
        @article = Article.new
    end

    def show
    end

    def edit
    end

    def update
        @article.update(article_params)
        redirect_to article_path(@article)
        # Redirect to the show page of the updated article
    end

    
    def create
        @article = current_user.articles.build(article_params)
        @article.add_categories(categories_ids)
        if @article.save
            redirect_to articles_path, notice: "Article was successfully created."
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def destroy
        @article.destroy
        redirect_to articles_path
    end




    private

    def article_params
        params.require(:article).permit(:name, :description, :avatar, :body, category_ids: [])
    end

    def categories_ids
       article_params[:category_ids]&.reject(&:blank?) || []
    end 

    def set_article
        @article = Article.find(params[:id])
    end
end
