require 'rails_helper'
require 'cancan/matchers'

describe 'Ability' do
  describe 'abilities' do
    subject(:ability) { Ability.new(user) }
    let(:user) { nil }

    context 'quando user é admin' do
      let(:user) { User.new(cargo: "Admin") }

      it { is_expected.to be_able_to(:manage, User.new) }
    end

    context 'quando user é da secretaria' do
      let(:user) { User.new(cargo: "Secretaria") }

      it { is_expected.to be_able_to(:manage, User.new(cargo: "Professor")) }
    end
  end
end