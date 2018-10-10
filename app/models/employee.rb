class Employee < ApplicationRecord
  belongs_to :company
  validates :name, :company, presence: true
end
