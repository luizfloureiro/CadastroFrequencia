class TurmasController < ApplicationController

  def index
    @turmas = Turma.all
  end

  def show
  end

  def new
    @turma = Turma.new
  end

  def create
    @turma = Turma.new(turma_params)

    if @turma.save
      redirect_to turmas_path, notice: "Turma criada com sucesso!"
    else
      render 'new'
    end
  end

  def destroy
    @turma = Turma.find(params[:id])

    if @turma.destroy
      redirect_to turmas_path, notice: "Turma removida com sucesso!"
    else
      render turmas_path, warn: "Não foi possível remover a turma!"
    end
  end

  private
  def turma_params
    params.require(:turma).permit(:nome, :dias, :inicio, :fim, :cargamin, :cargamax, :capacidade)
  end
end
