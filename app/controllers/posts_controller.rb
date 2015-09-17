class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new 
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create 
    @post = Post.new(post_params)
    if @post.save
      # render json: @post, status: 201
      redirect_to '/'
    else
      render json: @post.errors, status: 422
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      # render json: @post, status: :ok
      # @post
      redirect_to '/'
    else
      render json: @post.errors, status: 422
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/'
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
