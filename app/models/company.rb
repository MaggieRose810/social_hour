class Company < ApplicationRecord

  validates :name, :group_size, presence: true
  has_many :employees
  has_many :groups

  def groups_per_week
    employees.count / group_size
  end
end
