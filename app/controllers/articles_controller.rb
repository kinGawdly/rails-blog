class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    # This will set @article for the specified actions  
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
        # Build a new article associated with the current user
        if @article.save
            redirect_to articles_path, notice: "Article was successfully created."
            # Redirect to the show page of the newly created article
        else
            render :new, status: :unprocessable_entity
            # Render the new template if validation fails
        end
    end
    
    def destroy
        @article.destroy
        redirect_to articles_path
        # Redirect to the index page after deletion
    end
    private

    def article_params
        params.require(:article).permit(:name, :description, :avatar, :body)
    end

    def set_article
        @article = Article.find(params[:id])
    end
        # This method can be used to DRY up the code in show, edit, update  
end
