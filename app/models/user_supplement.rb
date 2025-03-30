class UserSupplement < ApplicationRecord
  belongs_to :user
  belongs_to :supplement

  validates :dose_unit, inclusion: { in: %w[g mg ml IU] }, allow_blank: true
  validates :frequency_period, inclusion: { in: %w[day week month] }, allow_blank: true
end
