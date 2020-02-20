module TurmasHelper
  def vagas_restando(turma)
    pluralize(turma.capacidade - turma.alunos.count, 'vaga')
  end

  def prof_disponiveis(turma)
    options_from_collection_for_select(User.disponiveis(turma), :id, :nome, selected: turma.user)
  end

end
