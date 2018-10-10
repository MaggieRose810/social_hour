require "kafka"
class GroupMessage
  def initialize(group, kafka_client)
    @group = group
    @kafka_client = kafka_client
  end

  def payload
    {
      company_name: @group.company.name,
      event_at: @group.event_at,
      employees: @group.employees.pluck(:name)
    }
  end

  def deliver
    @kafka_client.deliver_message(payload.to_json, topic: "social-hour.groups")
  end
end
