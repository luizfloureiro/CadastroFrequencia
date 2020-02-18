class AlunosController < ApplicationController
  def create
    @turma = Turma.find(params[:turma_id])
    @aluno = @turma.alunos.create(aluno_params)

    redirect_to turma_path(@turma), notice: "Aluno cadastrado com sucesso!"
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
