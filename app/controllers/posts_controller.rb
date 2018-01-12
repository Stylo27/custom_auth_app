class PostsController < ApplicationController

  before_action :authorize, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    set_post
  end

  def edit
    set_post
  end

  def update
    @post = set_post
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    set_post.destroy
    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
