class AlunosController < ApplicationController

  def edit
    @turma = Turma.find(params[:turma_id])
    @aluno = Aluno.find(params[:id])
  end

  def create
    @turma = Turma.find(params[:turma_id])
    @aluno = @turma.alunos.create(aluno_params)

    redirect_to turma_path(@turma), notice: "Aluno cadastrado com sucesso!"
  end

  def update
    @turma = Turma.find(params[:turma_id])
    @aluno = Aluno.find(params[:id])

    if @aluno.update(aluno_params)
      redirect_to turma_path(@aluno.turma), notice: "Aluno editado com sucesso."
    else
      render 'edit'
    end
  end

  def destroy
    @turma = Turma.find(params[:id])
    @aluno = @turma.alunos.find(params[:id])
    @aluno.destroy

    redirect_to turma_path(@turma)
  end

  private
  def aluno_params
    params.require(:aluno).permit(:nome, :matricula, :email)
  end
end
