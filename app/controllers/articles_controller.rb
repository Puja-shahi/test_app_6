class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end
    
    def index
        @articles = Article.all
    end    
    
    def new
        @art = Article.new
    end
    
    def edit
        @article = Article.find(params[:id])
    end    
    
    def create
        @art = Article.new(params.require(:article).permit(:title, :description))
        if @art.save  
            flash[:notice] = "Article was created successfully"
            redirect_to @art
        else
            render 'new'
        end     
    end     
    
    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
           flash[:notice] = "Article was updated successfully"
           redirect_to @article
        else
            render 'edit'
        end    
    end    
end 