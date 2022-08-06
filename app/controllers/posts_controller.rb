class PostsController < ApplicationController
  def index
    @post = Post.new
    @room = Room.find(params[:room_id])
    @posts = @room.posts.includes(:user)
  end

  
  def new
    @post = Post.new
    logger.debug params
    @room_id = params[:room_id]
    @room = Room.find(params[:room_id])
    # @posts = @room.posts.includes(:user)
  end


  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:image,:post_title, :post_info, :room_id).merge(user_id: current_user.id)
  end

  #   params.require(:post).permit(:content).merge(user_id: current_user.id)
  #   params.require(:post).permit(:content, :image).merge(user_id: current_user.id)

  # end
end