class BooksController < ApplicationController

 def new

   @book = Book.new(params[:id])

 end

  def create

    @book = Book.new(book_params)
    if @book.save
       flash[notice] = "successfully"
       redirect_to book_path(@book.id)
    else
       flash.now[:alert] = "Failure"
       @books = Book.all
       render :index
    end

  end

  def index
    @book = Book.new
    @books = Book.all

  end


  def show

    @book = Book.new
    @book = Book.find(params[:id])

  end

  def edit

    @book = Book.find(params[:id])

  end

  def update

    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "Update Successful"
    redirect_to book_path(book.id)
  end


  def destroy

    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Successful deletion"
    redirect_to '/books'
  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end