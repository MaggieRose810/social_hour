class GroupScore
  def initialize(group)
    @group = group
  end

  def score
    employee_ids = @group.employees.pluck(:id)
    @group.employees.each do |employee|
      other_people = employee_ids.reject{ |id| id == employee.id}
      score = employee.score(other_people, @group)
      EmployeeGroup.find_by(employee: employee, group: @group).update(score: score)
    end
    @group.update(score: EmployeeGroup.where(group: @group).sum(:score))
  end
end