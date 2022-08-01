class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
    @user = current_user
    if @book.save
    flash[:notice] = "successfully"
    redirect_to book_path(@book)
    else
    render :index
    end
  end
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @users = @book.user
  end

  def show
  @book = Book.find(params[:id])
  @users = @book.user
  @booknew = Book.new
  @user = current_user
  
  end
  def edit
        @book = Book.find(params[:id])
      if  @book.user  == current_user
  else
    redirect_to books_path
  end
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
        redirect_to books_path
  end
  def update
  @book =Book.find(params[:id])
  if @book.update(book_params)
    flash[:notice] = "successfully"
  redirect_to book_path(@book.id)
  else
  render :edit
  end      
  end
  private
  def book_params
      params.require(:book).permit(:title, :body)
  end
end
