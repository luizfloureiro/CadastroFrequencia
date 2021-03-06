class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable :registerable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :login

  has_many :turmas

  validates_presence_of :nome
  validates_uniqueness_of :nome

  validates_presence_of :matricula
  validates_uniqueness_of :matricula

  scope :cargo, -> (cargo) {where(cargo: cargo)}

  scope :disponiveis, -> (turma) do
    left_outer_joins(:turmas).cargo("Professor").merge(Turma.disponiveis(turma.inicio, turma.fim, turma.dias, turma.id).or(where("turmas.id is NULL")))
  end

  def admin?
    self.cargo == "Admin"
  end

  def secretaria?
    self.cargo == "Secretaria"
  end

  def professor?
    self.cargo == "Professor"
  end

  def self.find_for_database_authentication warden_conditions
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(nome) = :value OR lower(matricula) = :value", { value: login.strip.downcase } ]).first
  end
end
