# frozen_string_literal: true

FactoryBot.define do
  factory :airport do
    code { '' }

    trait :burbank do
      code { 'BUR' }
    end

    trait :la do
      code { 'LAX' }
    end

    trait :bedford do
      code { 'BED' }
    end

    trait :boston do
      code { 'BOS' }
    end
  end
end
