class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]  # Only allow authenticated users to create/edit

  def index
    @posts = Post.all.order(created_at: :desc)  # Retrieve all posts, ordered by the newest first
  end

  def show  
  end
        
  def new 
    @post = Post.new
  end
    
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      puts @post.errors.full_messages
      render :new, alert: 'There was a problem creating the post.'
    end
  end  
   
  def edit
    redirect_to posts_path, alert: "You are not authorized to edit this post" unless current_user == @post.user
  end
     
  def update
    @post = Post.find (params[:id])
    if current_user == @post.user
      if @post.update(post_params) 
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    else 
      redirect_to posts_path, alert: "You are not authorized to update this post"
    end
  end  
     
  def destroy
    if current_user == @post.user
      @post.destroy
      redirect_to posts_path, notice: 'Post was successfully deleted.'
    else
      redirect_to posts_path, alert: "You are not authorized to delete this post"
    end
  end
  
  private
     
  def set_post
    @post = Post.find(params[:id]) 
  end
        
  def post_params
    params.require(:post).permit(:title, :content)
  end
end

