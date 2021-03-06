class BooksController < ApplicationController
  def new
  	  @book = Book.new
  	  @books = Book.all
  end
  def index
  	  @user = User.find(current_user.id)
  	  @book = Book.new
  	  @books = Book.all
  end
  def edit
  	  @book = Book.find(params[:id])
  end
  def update
  	  book = Book.find(params[:id])
  	  book.update(book_params)
  	  redirect_to book_path(book.id)
  end
  def create
  	  @book = Book.new(book_params)
  	  @book.user_id = current_user.id
  	  if @book.save
  	  	flash[:notice] = "Book was successfully created."
  	 	redirect_to book_path(@book.id)
  	  else
		flash[:notice] = "error"
		@user = User.find(current_user.id)
		@books = Book.all
		render :index
  	  end
  end
  def show
	  @book = Book.new
 	  @books = Book.find(params[:id])
   	  @user = @books.user
  end
  def destroy
  	  @book = Book.find(params[:id])
  	  @book.destroy
  	  redirect_to books_path
  end

  private
  def book_params
  	  params.require(:book).permit(:title, :body)
  end
end
