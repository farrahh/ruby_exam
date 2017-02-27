class UsersController < ApplicationController
  # **********************login*********************
  def index
  @user = User.find_by_id(session[:user_id])
  end

  def create
    user= User.create(name:params[:name], alias:params[:alias], email: params[:email], password:params[:password], password_confirmation:params[:password_confirmation])

    if user.valid?
        session[:user_id] = user[:id]
      redirect_to '/dashboard'
    else
      render json: user.errors
    end

  end

  def login
    user=User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user[:id]
      redirect_to '/dashboard'
    else
       render text: "Either email or password was incorrect"
    end
    end

  def logout
    session.clear
    redirect_to '/'
  end
  # *************************secrets*************************

  def post_create

    post=Post.create(content:params[:content], user_id:session[:user_id])

    redirect_to '/dashboard'
    end

def dashboard
 @posts = Post.all
 @user = User.find(session[:user_id])


 # @user_likes=
end


def show

end

def create_like
      double = Like.where(post: Post.find(params[:id]), user: User.find(session[:user_id]))
      if double.empty?
        Like.create(post: Post.find(params[:id]), user: User.find(session[:user_id]))
      end
      redirect_to "/dashboard"
    end

def destroy_dashboard
       Post.find(params[:id]).destroy
      #  render text: params[:id]
       redirect_to "/dashboard"
    end


end
