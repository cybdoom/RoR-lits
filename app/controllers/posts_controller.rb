class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    page = params[:page]
    page = Post.where("id >= ?", params[:id]).order('id DESC').count if params[:id] && !page
    @posts = Post.paginate(:page => page, :per_page => 1).order('id DESC')
    @latest_posts = Post.where("id < ?",@posts[0].id).order('id DESC').limit(3)
    unless @posts.empty?
      post = @posts[0]
      @page_title = post.meta_title.blank? ? post.title : post.meta_title
      @page_description = post.meta_description.blank? ? ActionView::Base.full_sanitizer.sanitize(post.body)[0..159] : post.meta_description
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

end
