class Api::V1::BooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @books = Book.all
     render json: @books
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book
    else
      render json: @book.errors
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    head 204
  end

  private

    def book_params
      params.permit(:title, :category, :author)
    end
end
