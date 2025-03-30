class Supplement < ApplicationRecord
  has_many :user_supplements

  validates :name, presence: true, uniqueness: true
  validates :with_food, inclusion: { in: %w[with without either] }, allow_blank: true
end
