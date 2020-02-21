require 'rails_helper'

describe 'TurmasHelper' do
  describe 'methods' do
    context '.vagas_restando(turma)' do
      let(:turma) { Turma.new(capacidade: 10) }
      it 'deve pluralizar vaga' do
        expect(helper.vagas_restando(turma))
      end
    end
  end
end