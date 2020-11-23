class Profile < ApplicationRecord
  has_many :links

  validates :name, presence: true
  validates :age, numericality: { only_integer: true }
end
