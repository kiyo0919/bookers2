class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id]) #ビューのlink_toで指定してるURLの引数にbookを指定している。従って、ルーティングでネストされているからbook_idには特定のbookのidが入っている。ネストはrails routesで確認できる。
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_to books_path
  end
end
