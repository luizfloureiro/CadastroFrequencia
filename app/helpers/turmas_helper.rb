module TurmasHelper
  def vagas_restando(turma)
    pluralize(turma.capacidade - turma.alunos.count, 'vaga')
  end
end
