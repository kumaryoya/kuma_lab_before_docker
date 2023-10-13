# frozen_string_literal: true

# Movie represents a model for managing information about movies.
class Movie < ApplicationRecord
  validates :title, presence: true
  validates :poster_path, presence: true
  validates :release_date, presence: true
  validates :overview, presence: true
end
