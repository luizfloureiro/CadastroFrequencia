require 'rails_helper'

describe 'Turma' do
  let(:turma) { build :turma }
  subject { turma }

  describe 'associations' do
    it { is_expected.to have_many :alunos }
  end

  describe 'validations' do
    it { is_expected.to define_enum_for(:dias).with_values(%i[Domingo Segunda Terça Quarta Quinta Sexta Sábado]) }
    it { is_expected.to validate_presence_of(:nome) }
    it { is_expected.to validate_presence_of(:inicio) }
    it { is_expected.to validate_presence_of(:fim) }
    it { is_expected.to validate_presence_of(:cargamin) }
    it { is_expected.to validate_presence_of(:cargamax) }
    it { is_expected.to validate_presence_of(:capacidade) }
  end

end