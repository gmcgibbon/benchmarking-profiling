class PostsController < ApplicationController
  before_action :load_author

  def index
    @posts = @author.posts
  end

  def show
    @post =  @author.posts.find(params[:id])
    100_000.times.map { Object.new }
  end

  private

  def load_author
    @author = Author.find(params[:author_id])
  end
end
