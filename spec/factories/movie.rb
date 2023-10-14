# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    sequence(:title) { |n| "movie#{n}.test_title" }
    sequence(:poster_path) { |n| "movie#{n}.test_poster_path" }
    sequence(:release_date) { |n| "movie#{n}.test_release_date" }
    sequence(:overview) { |n| "movie#{n}.test_overview" }
  end
end
