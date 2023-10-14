# frozen_string_literal: true

FactoryBot.define do
  factory :zoo do
    sequence(:name) { |n| "zoo#{n}.test_name" }
    sequence(:location) { |n| "zoo#{n}.test_location" }
    sequence(:area) { |n| "zoo#{n}.test_area" }
    sequence(:prefecture) { |n| "zoo#{n}.test_prefecture" }
    sequence(:link) { |n| "zoo#{n}.test_link" }
  end
end
