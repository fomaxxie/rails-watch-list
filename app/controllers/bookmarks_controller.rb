class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @list = List.find(params["list_id"])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params["list_id"]) #finds the list by id
    @bookmark = Bookmark.new(bookmark_params) #create a new movie bookmark
    @bookmark.list = @list #adds this movie bookmark to the list (db)
    @bookmark.save # saves the newly created movie bookmark
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
