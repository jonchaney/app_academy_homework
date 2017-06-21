require 'date'

class Cat < ActiveRecord::Base
  validates :birth_date, presence: true
  validates :color, presence: true, inclusion: {
    in: ["brown", "grey", "black", "orange"],
    message: "%{value} is not a valid color" }
  validates :name, presence: true
  validates :sex, presence: true, inclusion: {
    in: ["M", "F"],
    message: "Cat is only Male or Female, sorry."
  }
  validates :description, presence: true

  def age
    "#{Time.now.year - birth_date.year} year/s old"
  end
end
