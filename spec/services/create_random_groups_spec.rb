require 'rails_helper'

RSpec.describe(CreateRandomGroups) do
  let(:company) { create(:company, group_size: 3) }

  context "with 3 employees" do
    before {create_list(:employee, 3, company: company)}

    it "create 1 random group" do
      rand_group = CreateRandomGroups.new(company)
      expect do
        rand_group.create
      end.to change(Group, :count).by(1)

    end
  end

  context "with 9 employees" do
    before {create_list(:employee, 9, company: company)}

    it "create 3 random groups" do
      rand_groups = CreateRandomGroups.new(company)
      expect do
        rand_groups.create
      end.to change(Group, :count).by(3)
    end

    it "creates different groups" do
      srand(1234)
      rand_groups = CreateRandomGroups.new(company)
      rand_groups2 = CreateRandomGroups.new(company)
      group1, group2, group3 = rand_groups.create
      group4, group5, group6 = rand_groups2.create
      expect(group1.employees).not_to eq(group4.employees)
      expect(group2.employees).not_to eq(group5.employees)
      expect(group3.employees).not_to eq(group6.employees)
    end
  end
end