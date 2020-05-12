# frozen_string_literal: true

FactoryBot.define do
  factory :invention, class: 'Byg::Models::Invention' do
    sequence :id
    name { 'a' }
    power { 1 }
    scientist_id { create(:scientist).id }
    created_at { Time.now }
  end
end
