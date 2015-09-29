class PostsController < ApplicationController
  
  def current
    @posts = Post.current
  end

  def archive
    @posts = Post.archive
  end

end
