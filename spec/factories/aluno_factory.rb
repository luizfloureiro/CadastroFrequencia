FactoryBot.define do
  factory :aluno do
    sequence(:nome) { |n| "Aluno#{n}" }
    sequence(:matricula) { |n| "Matricula#{n+100}" }
    sequence(:email) { |n| "a#{n}@e.com" }

    association :turma, factory: [:turma, :segunda]
  end
end
