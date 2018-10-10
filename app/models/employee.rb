class Employee < ApplicationRecord
  belongs_to :company
  has_many :employee_groups
  has_many :groups, through: :employee_groups
  validates :name, :company, presence: true
end
