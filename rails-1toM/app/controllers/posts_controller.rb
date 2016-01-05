class PostsController < ApplicationController
  def index
    @posts = Post.all
    gon.something = "hello"
    gon.people = ['Patrick', 'Sean', 'Sam']
    gon.posts = Post.all
  end

  def create
    Post.create post_params
    redirect_to posts_path
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find params[:id]
  end

  def show
    @post = Post.find params[:id]
    # render json: params
  end

  def update
    t = Post.find params[:id]
    t.update Post_params
    redirect_to posts_path
  end

  def destroy
    result = Post.destroy params[:id]
    respond_to do |format|
      format.html {redirect_to :posts}
      format.json {render json: result}
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :username)
  end
end