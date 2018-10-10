require 'rails_helper'

RSpec.describe GroupMessage, type: :model do
  describe "#deliver" do
    it "gives kafka client the correct payload" do
      employee = create(:employee, name: "Maggie")
      company = create(:company, name: "My Company")
      group = create :group, employees: [employee], company: company
      kafka_client = double

      allow(kafka_client).to receive(:deliver_message)
      group_message = GroupMessage.new(group, kafka_client)
      group_message.deliver

      expect(kafka_client).to have_received(:deliver_message).with(
        "{\"company_name\":\"My Company\",\"event_at\":null,\"employees\":[\"Maggie\"]}",
        topic: "social-hour.groups"
      )
    end
  end
end