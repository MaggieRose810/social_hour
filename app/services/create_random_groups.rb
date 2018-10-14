class CreateRandomGroups

  def initialize(company)
    @company = company
  end

  def create
    i = 0
    employees.shuffle.each_slice(@company.group_size) do |employees|
      group = groups[i] || groups.last
      group.employees += employees
      i += 1
    end

    groups
  end

  private

  def groups
    @groups ||= @company.groups_per_week.times.map do
      @company.groups.create
    end
  end

  def employees
    @company.employees
  end

end