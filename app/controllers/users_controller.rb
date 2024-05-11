class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, ]

  def new

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user)
  else
    flash[:error] = "更新に失敗しました。"
    render :edit
  end
end


  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books

  end

  def create
    @book = Book.new(user_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to books_path(@book.id)
    else
      flash[:alert] = "The following errors prevented the book from being saved:"
      flash[:alert_details] = @book.errors.full_messages
      redirect_to new_book_path
    end
   end

 private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

end
