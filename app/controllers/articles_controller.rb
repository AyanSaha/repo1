class ArticlesController < ApplicationController
before_action :authenticate_user!
before_filter :set_last_seen_at, if: proc { user_signed_in? }
load_and_authorize_resource

def after_sign_in_path_for
 params[:target] || articles_path
end
def index
    @articles = Article.all
  end
def show
    @article = Article.find(params[:id])
  end
 def new
 end
 def edit
    if current_user.id!=params[:id].to_i then
        redirect_to articles_path
     else
    @article = Article.find(params[:id])
     end
  end
 

  def create
     @article = Article.new(article_params)
      if @article.save
          
          redirect_to @article
       else
       flash[:error]=@article.errors.full_messages[0]
       render 'new'
       end
  end
  
def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
def destroy
      if current_user.id!=params[:id].to_i then
         redirect_to articles_path
       else
       @article = Article.find(params[:id])
       @article.destroy
        redirect_to articles_path
        end
  end
def like
@article=Article.find(params[:id])
@article.liked_by current_user
   render 'articles/like'
end
def unlike
  @article = Article.find(params[:id])
  @article.disliked_by current_user
     render 'articles/like'
end
private
def set_last_seen_at
  current_user.update_attribute(:last_seen_at, Time.now)
   end
 def article_params
    params.require(:article)[:user_id] = current_user.id
puts params
    params.require(:article).permit(:title, :text, :user_id)
  end
end
