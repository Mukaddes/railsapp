class BookController < ApplicationController
  layout 'standard'
  def list
    @books = Book.all
  end
  def show
    @book = Book.find(params[:id])
  end
  def new
    @book = Book.new
    @subjects = Subject.all
  end
  def create
    @book = Book.new
    @book.title = params[:title]
    @book.price = params[:price]
    @book.description = params[:description]
    @book.subject = params[:subject]

    if @book.save!
      redirect_to :action => 'list'
    else
      @subjects = Subject.all
      render :action => 'new'
    end
  end
  def edit
    @book = Book.find(params[:id])
    @subjects = Subject.all
  end
  def update
    @book = Book.find(params[:id])
    @book.update_attributes(book_params)
    if @book.save!
      redirect_to :action => 'show', :id => @book
    else
      @subjects = Subject.all
      render :action => 'edit'
    end
  end
  def delete
    Book.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def show_subjects
    @subject = Subject.find(params[:id])
  end
  def index
    render :file => 'app\views\book\uploadfile.html'
  end
  def uploadfile
    puts params.inspect # Add this line to see what's going on
    post = DataFile.save(params[:upload])
    render :action => 'congrats'
  end

  def congrats
  end
  private

  def book_params
    params.require(:book).permit(:title, :price, :description, :subject)
  end

end