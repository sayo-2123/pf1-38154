class PostsController < ApplicationController
  def index
    @post = Post.new
    @room = Room.find(params[:room_id])
    @posts = @room.posts.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @post = @room.posts.new(post_params)
    @post.save
    if @post.save
      redirect_to room_posts_path(@room)
    else
      @posts = @room.posts.includes(:user)
      render :index
    end
  end
  

  private

  def post_params
    params.require(:post).permit(:content).merge(user_id: current_user.id)
    params.require(:post).permit(:content, :image).merge(user_id: current_user.id)
  end
end