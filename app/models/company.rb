class Company < ApplicationRecord
  GROUP_SIZE = 3
  validates :name, presence: true
  has_many :employees
  has_many :groups

  def groups_per_week
    employees.count / GROUP_SIZE
  end
end
