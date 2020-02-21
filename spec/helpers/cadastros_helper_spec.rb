require 'rails_helper'

describe 'CadastrosHelper' do
  describe 'methods' do
    describe '.gera_cargos' do
      let(:user_adm) { build :user, :admin }
      let(:user_sec) { build :user, :secretaria }
      let(:user_prof) { build :user, :professor }

      context 'usuário é administrador' do
        it { expect(helper.gera_cargos(user_adm)).to match_array %w(Admin Secretaria) }
      end
      context 'usuário é da secretaria' do
        it { expect(helper.gera_cargos(user_sec)).to match_array ["Professor"] }
      end
      context 'usuário é professor' do
        it { expect(helper.gera_cargos(user_prof)).to match_array [""] }
      end
    end
  end
end