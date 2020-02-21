require 'rails_helper'

describe 'TurmasHelper' do
  describe 'methods' do
    context '.vagas_restando(turma)' do
      let(:turma) { Turma.new(capacidade: 10) }
      context 'turma vazia' do
        it { expect(helper.vagas_restando(turma)).to match("0 vagas") }
      end
    end
  end
end