class Employee < ApplicationRecord
  belongs_to :company
  has_many :employee_groups
  has_many :groups, through: :employee_groups
  validates :name, :company, presence: true

  def score(other_people, group)
    EmployeeGroup.where(
      employee_id: other_people,
      group_id: groups.where.not(id: group.id).pluck(:id)
    ).count
  end
end