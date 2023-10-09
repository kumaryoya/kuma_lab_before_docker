# frozen_string_literal: true

# Shogun represents a model for managing information about shoguns.
class Shogun < ApplicationRecord
  validates :score, presence: true
end
