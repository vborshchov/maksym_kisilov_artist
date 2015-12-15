module PostsHelper
  def title_yml(params)
    @title_url = '.posts.current.title' if params == 'current'
    @title_url = '.posts.archive.title' if params == 'archive'
  end
end
