class ArticlesController < ApplicationController
    before_action :find_article, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
        if params[:category].blank?
          @clanci = Article.all.order("created_at DESC")
        else
          @category_id = Category.find_by(name: params[:category]).id
          @clanci = Article.where(category_id: @category_id).order("created_at DESC")
          @subcategory = Category.search_owner(@category_id).order("name ASC")
        end
    end
    
    def result
        if params[:search]
            @clanci = Article.search(params[:search]).order("created_at DESC")
        else
            @clanci = Article.all.order('created_at DESC')
        end
    end 

    
    def show
        if params[:comment]
            Comment.create :content => params[:comment], :article_id => @article.id, :votes => 0
        end 
        @clanci =  Comment.search1(params[:id]).order("votes DESC")
    end
    
    def new
        @article = current_user.articles.build
    end
    
    def votes
        #aa
        @clanci =  Comment.search1(params[:article_id]).order("votes DESC")
        @clanci.each do |comment|
            if params[comment.content]=="yes"
                comment.update(:votes => comment.votes+1)
            end
        end
        @article = Article.find(params[:article_id])
        redirect_to @article
    end

    def create
        @article = current_user.articles.build(article_params)
        if @article.save
            flash[:success] = "Article Created successly!"
            redirect_to @article 
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        @clanci= Old.create :articles_id => @article.id, :title => @article.title, :content => @article.content, :user_id => @article.user_id, :category_id => @article.category_id, :created_at => @article.created_at, :updated_at => @article.updated_at
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end
    
    def destroy
        @article.destroy
        redirect_to root_path
    end
    
    private
    
    def find_article
        @article = Article.find(params[:id])
    end
    
    def article_params
        params.require(:article).permit(:title, :content, :category_id)
    end
end
