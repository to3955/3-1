class BooksController < ApplicationController

 def new

   @book = Book.new(params[:id])

 end

  def create
    
    book = Book.new(book_params)
    
    book.save
    
    redirect_to book_path(book.id)
  end

  def index
    @books = Book.all

  end


  def show
    
    @book = Book.new
    @book = Book.find(params[:id])

  end

  def edit
    
    @book = Book.find(parms[:id])
     
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(list.id)  
  end

private
  def book_params
    params.permit(:title, :body)
  end

end