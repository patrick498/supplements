# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
Intake.destroy_all
Supplement.destroy_all
User.destroy_all

# Create a user
user = User.create!(
  email: "test@a.com",
  password: "123123"
)

puts "Created test user ✅"

# Create supplements
vitamin_d = Supplement.create!(name: "Vitamin D3", with_food: "with")
magnesium = Supplement.create!(name: "Magnesium Glycinate", with_food: "with")
tryptophan = Supplement.create!(name: "L-Tryptophan", with_food: "without")
ashwagandha = Supplement.create!(name: "Ashwagandha", with_food: "either")

puts "Created supplements ✅"

# Create intakes
Intake.create!([
  {
    user: user,
    supplement: vitamin_d,
    dose: 1000,
    dose_unit: "IU",
    time_of_day: "with_breakfast",
    empty_stomach: false
  },
  {
    user: user,
    supplement: magnesium,
    dose: 200,
    dose_unit: "mg",
    time_of_day: "with_dinner",
    empty_stomach: false
  },
  {
    user: user,
    supplement: tryptophan,
    dose: 500,
    dose_unit: "mg",
    time_of_day: "before_bed",
    empty_stomach: true
  },
  {
    user: user,
    supplement: ashwagandha,
    dose: 600,
    dose_unit: "mg",
    time_of_day: "afternoon",
    empty_stomach: true
  }
])

puts "Created intakes ✅"
