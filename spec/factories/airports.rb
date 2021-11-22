FactoryBot.define do
  factory :airport do
    code { '' }
    
    trait :burbank do
      code { 'BUR' }
    end

    trait :la do
      code { 'LAX' }
    end

    trait :boston do
      code { 'BOS' }
    end
  end
end
