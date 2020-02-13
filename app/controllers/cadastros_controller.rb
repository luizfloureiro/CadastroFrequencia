class CadastrosController < ApplicationController
  before_action :authorize_admin, only: :create

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Usuário cadastrado com sucesso."
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    debugger
    if @user.update(update_params)
      redirect_to cadastros_path, notice: "Dados alterados com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
      redirect_to cadastros_path, notice: "Usuário removido."
    else
      render 'index', notice: "Não foi possível remover o usuário."
    end

  end

  private
  def authorize_admin
    return if current_user.admin? || current_user.secretaria?
    redirect_to root_path, alert: 'Apenas administradores.'
  end

  def user_params
    params.require(:user).permit(:nome, :matricula, :email, :cargo, :password, :password_confirmation)
  end

  def update_params
    params.require(:user).permit(:email)
  end

end
