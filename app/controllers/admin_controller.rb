class AdminController < ApplicationController
  before_action :check_status


  # def show
  #   @user = User.find(session[:user_id])
  #   @user_posts=Post.where(user_id:session[:user_id])
  #   @liked_posts = Like_unlike.where(user:params[:id])
  #
  # end

  def add
     redirect_to "/show"
  end

  def info
     redirect_to "/show"
  end

  def back

       redirect_to "/dashboard"
  end

  def show

    @user_posts_count = Post.where(user: User.find(params[:id])).count
    @user_likes_count = Like.where(user: User.find(params[:id])).count
    @user = User.find(session[:user_id])
    @user_info= User.find(params[:id])

  print @posts, "iiiiiiiiiiiiiii"

  end

  def post_detail

  @post=Post.find(params[:id])
  @users_liked_post= Post.find(params[:id]).likes
  print @users_liked_post, "*******************************"
  end


  private

  def check_status
    if !session[:user_id]
      redirect_to '/'
    end
end
end
