class CadastrosController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new

    if @user.save
      redirect_to index
    else
      render 'new'
    end
  end

end
