class Intake < ApplicationRecord
  belongs_to :user
  belongs_to :supplement

  DOSE_UNIT_OPTIONS = %w[g mg ml IU].freeze
  TIME_OF_DAY_VALUES = {
    morning: "morning (first thing)",
    with_breakfast: "with breakfast",
    mid_morning: "mid-morning",
    with_lunch: "with lunch",
    afternoon: "afternoon",
    with_dinner: "with dinner",
    before_bed: "before bed",
    night: "night"
  }.freeze
  TIME_OF_DAY_OPTIONS = TIME_OF_DAY_VALUES.keys.map(&:to_s).freeze
  TIME_OF_DAY_ORDER = TIME_OF_DAY_VALUES.keys.map(&:to_s).freeze

  validates :dose_unit, inclusion: { in: DOSE_UNIT_OPTIONS }, allow_blank: true
  validates :time_of_day, inclusion: { in: TIME_OF_DAY_OPTIONS }

  def display_time_of_day
    self.class::TIME_OF_DAY_VALUES[time_of_day&.to_sym] || time_of_day
  end

  def self.sorted_by(field, direction)
    direction = %w[asc desc].include?(direction) ? direction : 'asc'

    case field
    when "time_of_day"
      order_sql = "CASE time_of_day " + TIME_OF_DAY_ORDER.each_with_index.map { |val, i| "WHEN '#{val}' THEN #{i}" }.join(" ") + " ELSE 999 END"
      order(Arel.sql(order_sql))
    when "name"
      joins(:supplement).order("supplements.name #{direction.upcase}")
    else
      all # fallback: no sorting
    end
  end
end
