require 'rails_helper'

describe 'Aluno' do
  let(:aluno) { Aluno.new }
  subject { aluno }

  describe 'associations' do
    it { is_expected.to belong_to :turma }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:nome) }

    it { is_expected.to validate_presence_of(:matricula) }
    it { is_expected.to validate_uniqueness_of(:matricula).ignoring_case_sensitivity }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end
end