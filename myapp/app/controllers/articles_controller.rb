class ArticlesController < ApplicationController
    #http_basic_authenticate_with name: "tt", password: "tt", except: [:index, :show]
    before_action :authenticate_user!
    def index
        @articles = Article.all
    end
    def show
        @article = Article.find(params[:id])
    end
    
    def new
        @article = current_user.articles.new
    end
    def edit
        @article = Article.find(params[:id])
        authorize! :manage, @article
    end
    def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
        redirect_to @article
    else
        render 'edit'
    end
    end
    def create
        @article = current_user.articles.new(article_params)
       
        if @article.save
          redirect_to @article
        else
          render 'new'
        end
    end
    def destroy
        
        @article = Article.find(params[:id])
        authorize! :manage, @article
        @article.destroy
      
        redirect_to articles_path
    end   
    private
     def article_params
          params.require(:article).permit(:title, :text)
     end
end
