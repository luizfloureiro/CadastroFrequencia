FactoryBot.define do
  factory :user do
    sequence(:nome) { |n| "Pessoa#{n}" }
    sequence(:matricula) { |n| "#{n}" }
    sequence(:email) { |n| "p#{n}@email.com" }
    password { "123123" }

    trait :admin do
      cargo { "Admin" }
    end

    trait :secretaria do
      cargo { "Secretaria" }
    end

    trait :professor do
      cargo { "Professor" }
    end

    factory :user_com_turma do
      cargo { "Professor" }

      transient do
        turmas_count { 5 }
      end

      after(:create) do |user, eval|
        create_list(:turma, eval.turmas_count, user: user)
      end
    end
  end
end
