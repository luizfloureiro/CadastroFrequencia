class Turma < ApplicationRecord
  enum dias: [:Domingo, :Segunda, :Terça, :Quarta, :Quinta, :Sexta, :Sábado]
end
