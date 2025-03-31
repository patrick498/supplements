class Intake < ApplicationRecord
  belongs_to :user
  belongs_to :supplement

  validates :dose_unit, inclusion: { in: %w[g mg ml IU] }, allow_blank: true
end
