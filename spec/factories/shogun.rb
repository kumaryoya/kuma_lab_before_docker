# frozen_string_literal: true

FactoryBot.define do
  factory :shogun do
    sequence(:score) { |n| "shogun#{n}.test_score" }
  end
end
