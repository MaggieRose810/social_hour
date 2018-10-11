require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe "#valid?" do
    it "invalid without a name" do
      employee = build :employee, name: nil
      expect(employee).to be_invalid
    end

    it "valid" do
      employee = build :employee
      expect(employee).to be_valid
    end
  end
  describe "#score" do
    let (:new_group) { create :group }
    it "zero with no previous groups" do
      employee = create :employee
      employee2 = create :employee
      score = employee.score(employee2.id, new_group)
      expect(score).to eq(0)
    end

    it "zero with previous groups and no overlapping users" do
      employee = create :employee
      employee2 = create :employee
      group = create :group, employees: [employee, employee2]
      employee3 = create :employee
      score = employee.score(employee3.id, new_group)
      expect(score).to eq(0)
    end

    it "is 1 with previous group and one overlapping user" do
      employee = create :employee
      employee2 = create :employee
      group = create :group, employees: [employee, employee2]
      score = employee.score(employee2.id, new_group)
      expect(score).to eq(1)
    end

    it "is two with previous group and two overlapping users" do
      employee = create :employee
      employee2 = create :employee
      employee3 = create :employee
      group = create :group, employees: [employee, employee2, employee3]
      score = employee.score([employee2.id, employee3.id], new_group)
      expect(score).to eq(2)
    end

    it "is two with same user overlapping in multiple previous groups" do
      employee = create :employee
      employee2 = create :employee
      group = create :group, employees: [employee, employee2]
      group2 = create :group, employees: [employee, employee2]
      score = employee.score(employee2.id, new_group)
      expect(score).to eq(2)
    end

  end
end
