class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]


  def index
    @posts = Post.all.reverse
  end

  def new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = 'Created'
      redirect_to @post
    else
      flash[:error] = @post.errors.full_messages
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
      flash[:notice] = 'Updated'
      redirect_to @post
    else
      flash[:error] = @post.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    set_post.destroy
    flash[:notice] = 'Deleted'
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
