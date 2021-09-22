class ArticlesController < ApplicationController
    def index
        @articles = Article.paginate(page: params[:page], per_page: 3)
    end
    def show
        @article = Article.find(params[:id])
    end
    def edit
        @article = Article.find(params[:id])
    end
    def update
        @article = Article.find(params[:id])
        respond_to do |format|
            @article.update(params.require(:article).permit(:title, :description, :author))
            format.html { redirect_to @article, notice: "Article was successfully updated." }
        end
    end
    def destroy
        @article = Article.find(params[:id])
        respond_to do |format|
            @article.destroy
            format.html { redirect_to articles_url, notice: "Article was successfully updated." }
        end
    end
    def create
        @article = Article.new(params.require(:article).permit(:title, :description, :author))
        @article.user = current_user
        respond_to do |format|
            @article.save
            format.html { redirect_to @article, notice: "Article was successfully created." }
        end
    end
    def new 
        @article = Article.new
    end
end