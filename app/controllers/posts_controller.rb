class PostsController < ApplicationController
  before_filter :title, only: [:index]

  def index
    case params[:show]
    when "current"
      @posts = Post.current.page(params[:page])
    when "archive"
      @posts = Post.archive.page(params[:page])
    end
  end

  private

    def title
      @title_yml_path = 'posts.current.title' if params[:show] == 'current'
      @title_yml_path = 'posts.archive.title' if params[:show] == 'archive'
    end

    def categories_params
      params.require(:category).permit(:page, :show)
    end

end
