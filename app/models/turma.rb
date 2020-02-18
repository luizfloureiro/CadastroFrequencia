class Turma < ApplicationRecord
  has_many :alunos
  belongs_to :user, optional: true

  enum dias: [:Domingo, :Segunda, :Terça, :Quarta, :Quinta, :Sexta, :Sábado]

  validate :usuario_deve_ser_professor

  private
  def horario_professor_nao_conflita

  end

  def usuario_deve_ser_professor
    unless user.nil?
      unless user.professor?
        errors.add(:cargo_invalido, "deve ter o cargo de professor")
      end
    end
  end
end
