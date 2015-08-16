class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def show
    respond_to do |format|
      format.html
      format.csv
      format.xml { render xml: @book }
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
