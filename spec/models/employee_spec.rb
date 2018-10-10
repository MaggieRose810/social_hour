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
end
