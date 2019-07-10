class ArticlesController < ApplicationController
    before_action :load_user, only: [:index, :new, :create, :edit, :show]
    before_action :load_article, only: [:destroy]
    
    def index
        @articles = @user.articles
    end

    def new
        @article = Article.new
    end

    def create 
        @article = Article.new article_attribute
        @article.user_id = current_user.id 
        if @article.save
            redirect_to [@user, @article]
        else 
            render :new
        end
    end

    def update
        if @article.update article_attribute
            redirect_to @article
        else
            render :edit
        end
    end

    def show
        @article = @user.articles.find(params[:id])
    end

    def destroy
        @article.destroy
        redirect_to :article
    end

    def article_attribute
        params[:article].permit(:title, :chapeau, :text, :creation_date, :image)
    end

    def load_user
        @user = User.find(params[:user_id])
    end

    def load_article
        @article = Article.find(params[:id])
    end
end
