class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.all
        end
    
    def new 
        @article = Article.new
    end

    def show
    @comment = Comment.new
    end

    def edit
    end

    def update
        if @article.update(article_params)
             redirect_to article_path(@article), notice: "Article was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end 
    end

    
    def create
        @article = current_user.articles.build(article_params)
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

  

    def set_article
        @article = Article.find(params[:id])
    end
end
