class Turma < ApplicationRecord
  has_many :alunos

  enum dias: [:Domingo, :Segunda, :Terça, :Quarta, :Quinta, :Sexta, :Sábado]
end
