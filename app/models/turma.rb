class Turma < ApplicationRecord
  has_many :alunos
  belongs_to :user, optional: true

  enum dias: [:Domingo, :Segunda, :Terça, :Quarta, :Quinta, :Sexta, :Sábado]

  validates_presence_of :nome
  validates_presence_of :inicio
  validates_presence_of :fim
  validates_presence_of :cargamin
  validates_presence_of :cargamax
  validates_presence_of :capacidade

  validate :horario_deve_ser_valido
  validate :usuario_deve_ser_professor

  scope :dia_nao_conflitante, -> (dia) { where.not(dias: dia) }
  scope :dia_conflitante, -> (dia, id) { where(dias: dia).where.not(id: id) }

  scope :horario_nao_conflitante, -> (inicio, fim) do
    where.not(":inicio > inicio and :inicio < fim", inicio: inicio).where.not(":fim > inicio and :fim < fim", fim: fim)
  end

  scope :disponiveis, -> (inicio, fim, dia, id) do
    dia_nao_conflitante(dia).or(dia_conflitante(dia, id).horario_nao_conflitante(inicio, fim))
  end

  private
  def horario_deve_ser_valido
    if self.inicio >= self.fim
      errors.add(:horario_invalido, "horário de início não deve ser igual ou depois do horário de fim.")
    end
  end

  def usuario_deve_ser_professor
    unless user.nil?
      unless user.professor?
        errors.add(:cargo_invalido, "deve ter o cargo de professor")
      end
    end
  end
end
