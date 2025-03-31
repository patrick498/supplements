class Intake < ApplicationRecord
  belongs_to :user
  belongs_to :supplement

  DOSE_UNIT_OPTIONS = %w[g mg ml IU].freeze
  TIME_OF_DAY_OPTIONS = [
    "first thing in the morning",
    "with breakfast",
    "between breakfast and lunch",
    "with lunch",
    "between lunch and dinner",
    "with dinner",
    "before bed",
    "middle of the night"
  ].freeze

  validates :dose_unit, inclusion: { in: DOSE_UNIT_OPTIONS }, allow_blank: true
  validates :time_of_day, inclusion: { in: TIME_OF_DAY_OPTIONS }
end
