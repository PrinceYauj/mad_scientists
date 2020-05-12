# frozen_string_literal: true

FactoryBot.define do
  factory :scientist, class: 'Byg::Models::Scientist' do
    sequence :id
    madness { 1 }
    attempts { 1 }
    created_at { Time.now }

    trait :with_inventions do
      after(:create) do |scientist|
        create_list(:invention, 2, scientist_id: scientist.id)
      end
    end
  end
end
