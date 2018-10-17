require 'rails_helper'

RSpec.describe(CreateMinimallyPaired) do
  let(:company) {create(:company, group_size: 3)}

  it "creates groups" do
    employees = create_list :employee, 9, company: company
    expect do
      CreateMinimallyPaired.new(company).create
    end.to change(Group, :count).by(3)
  end

  it "remainder employees are put into an existing group" do
    employees = create_list :employee, 8, company: company
    expect do
      CreateMinimallyPaired.new(company).create
    end.to change(Group, :count).by(2)
  end

  it "every employee is put into one group" do
    employees = create_list :employee, 8, company: company
    paired_groups = CreateMinimallyPaired.new(company)
    paired_groups.create
    group1, group2 = paired_groups.groups
    expect(group1.employees.size).to eql(3)
    expect(group2.employees.size).to eql(5)
  end

  it "does not pair people who score high together" do
    employees = create_list :employee, 8, company: company
    emp1, emp2 = employees

    create(:group, employees: [emp1, emp2], company: company)

    paired_groups = CreateMinimallyPaired.new(company)
    paired_groups.create
    group1, group2 = paired_groups.groups
    expect(group1.employees).to include(emp1)
    expect(group1.employees).not_to include(emp2)
  end

end