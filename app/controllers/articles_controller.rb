class ArticlesController < ApplicationController
   
   def index
      @articles = Article.all
   end
   
   def new
       @article = Article.new
   end
   
   def edit
      @article = Article.find(params[:id])
   end
   
   def show
      @article = Article.find(params[:id])
   end
   
   def destroy
      @article = Article.find(params[:id])
      @article.destroy
      flash[:notce] = "The article was succesfully deleted"
      redirect_to articles_path
   end
   
   
   def update
      #render plain: params[:article].inspect
      @article = Article.find(params[:id])
      if @article.update(article_params) 
         #do sth
         flash[:notice] = "Article was succesfully updated"
         redirect_to article_path(@article)  #show_path  article/id format
      else
         render 'edit'
      end 
   end
   
   def create
      #render plain: params[:article].inspect
      @article = Article.new(article_params)
      if @article.save
         #do sth
         flash[:notice] = "Article was succesfully created"
         redirect_to article_path(@article)  #show_path  article/id format
      else
         render 'new'
      end
   end
   
   private
   def article_params
      params.require(:article).permit(:title, :description)
   end
end