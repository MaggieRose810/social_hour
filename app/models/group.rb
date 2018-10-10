class Group < ApplicationRecord
  belongs_to :company
  has_many :employee_groups
  has_many :employees, through: :employee_groups
end
