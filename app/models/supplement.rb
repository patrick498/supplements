class Supplement < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :with_food, inclusion: { in: %w[with without either] }
end
