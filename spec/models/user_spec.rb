require 'rails_helper'

describe 'User', type: :model do
  let(:user) { User.new }
  subject { user }

  describe 'associations' do
    it { is_expected.to have_many(:turmas) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:nome) }
    it { is_expected.to validate_uniqueness_of(:nome) }

    it { is_expected.to validate_presence_of(:matricula) }
    it { is_expected.to validate_uniqueness_of(:matricula).ignoring_case_sensitivity }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }

    describe 'methods' do
      describe '#admin?' do
        let(:user_admin) { User.new(cargo: "Admin") }
        let(:user_nao_admin) { User.new(cargo: "Secretaria") }

        context 'quando admin' do
          it { expect(user_admin.admin?).to be_truthy }
        end
        context 'quando não for admin' do
          it { expect(user_nao_admin.admin?).to be_falsey }
        end
      end

      describe '#secretaria?' do
        let(:user_secretaria) { User.new(cargo: "Secretaria") }
        let(:user_nao_secretaria) { User.new(cargo: "Admin") }

        context 'quando secretaria' do
          it { expect(user_secretaria.secretaria?).to be_truthy }
        end
        context 'quando não for secretaria' do
          it { expect(user_nao_secretaria.secretaria?).to be_falsey }
        end
      end

      describe '#professor?' do
        let(:user_professor) { User.new(cargo: "Professor") }
        let(:user_nao_professor) { User.new(cargo: "Admin") }

        context 'quando professor' do
          it { expect(user_professor.professor?).to be_truthy }
        end
        context 'quando não for professor' do
          it { expect(user_nao_professor.professor?).to be_falsey }
        end
      end
    end
  end
end