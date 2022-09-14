class Restaurant < ApplicationRecord
  validates :name, :address, :category, presence: true
  # validates :phone_number, allow_blank: true
  validates :category, inclusion: {
    in: %w[chinese italian japanese french belgian],
    message: '%<value> is not a valid category'
  }

  has_many :reviews, dependent: :destroy
end
