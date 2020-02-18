class Aluno < ApplicationRecord
  belongs_to :turma

  validates_presence_of :nome

  validates_presence_of :matricula
  validates_uniqueness_of :matricula

  validates_presence_of :email
  validates_uniqueness_of :email
end
