class CreateMinimallyPaired

  def initialize(company)
    @company = company
  end

  def create
    unprocessed = employees

    groups.each do |group|
      emp = unprocessed.shift
      other_emps = unprocessed.sort do |a, b|
        a.score(emp.id, group) <=> b.score(emp.id, group)
      end.shift(@company.group_size - 1)

      unprocessed = unprocessed - other_emps
      group.employees = other_emps.unshift(emp)
    end

    if unprocessed.any?
      groups.last.employees += unprocessed
    end

    groups
  end

  def groups
    @groups ||= @company.groups_per_week.times.map do
      @company.groups.create
    end
  end

  def employees
    @employees ||= @company.employees.to_a
  end

end