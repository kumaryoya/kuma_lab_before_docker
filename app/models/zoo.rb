class Zoo < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true, uniqueness: true
  validates :area, presence: true
  validates :prefecture, presence: true
  validates :link, presence: true, uniqueness: true

  def self.ransackable_attributes(*)
    %w[area name]
  end
end
