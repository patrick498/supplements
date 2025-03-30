class Supplement < ApplicationRecord
  has_many :intakes

  validates :name, presence: true, uniqueness: true
  validates :with_food, inclusion: { in: %w[with without either] }, allow_blank: true
end
