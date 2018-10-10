require 'rails_helper'

RSpec.describe Company, type: :model do
  describe "#valid?" do
    it "invalid without a name" do
      company = build :company, name: nil
      expect(company).to be_invalid
    end

  end

end
