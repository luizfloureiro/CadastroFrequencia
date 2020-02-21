FactoryBot.define do
  factory :turma do
    sequence(:nome) { |n| "Turma#{n}" }
    sequence(:inicio) { |n| "#{n}" }
    sequence(:fim) { |n| "#{n + 1}" }

    cargamin { "10" }
    cargamax { "20" }
    capacidade{ "5" }

    association :user, factory: [:user, :professor]

    trait :segunda do
      dias { Segunda }
    end
    trait :terca do
      dias { Terca }
    end
    trait :quarta do
      dias { Quarta }
    end

    trait :turma_com_alunos do
      transient do
        alunos_count { 5 }
      end

      after(:create) do |turma, eval|
        create_list(:aluno, eval.alunos.count, turma: turma)
      end
    end
  end
end