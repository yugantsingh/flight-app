class Aeroplane < ApplicationRecord
  has_many :flights, dependent: :destroy
  validates :plane, presence: true
  validates :first_class_columns, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 10 }
  validates :first_class_rows, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 10 }
  validates :business_class_columns, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 10 }
  validates :business_class_rows, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 10 }
  validates :economy_class_columns, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 10 }
  validates :economy_class_rows, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 10 }
  validates :model, presence: true


  before_save :calculate_total_seats

  private

  def calculate_total_seats
    self.seats = (first_class_columns * first_class_rows) + (business_class_columns * business_class_rows) + (economy_class_columns * economy_class_rows)
  end
end
