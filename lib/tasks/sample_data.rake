namespace :sample_data do
  desc 'create all'
  task :create_all, [:count] => :environment do |t, args|
    Rake::Task["sample_data:create_sample_companies"].execute(args)
    Rake::Task["sample_data:create_sample_employees"].execute
    Rake::Task["sample_data:create_sample_employee_groups"].execute

    client = Kafka.new([ENV["KAFKA_HOST"]], client_id: "social-hour-app")
    Group.find_each do |group|
      GroupMessage.new(group, client).deliver
    end
  end

  desc 'create sample companies'
  task :create_sample_companies, [:count] => :environment do |t, args|
    args[:count].to_i.times do
      Company.create(name: Faker::Company.name)
    end
  end

  desc 'create sample employees'
  task create_sample_employees: :environment do
    Company.find_each do |company|
      employees = 20.times.map do
        company.employees.build(
          name: Faker::Name.first_name,
          email: Faker::Internet.email
        )
      end
      Employee.import(employees)
    end
  end

  desc 'create sample employee_groups'
  task create_sample_employee_groups: :environment do
    weeks_of_data = 2
    Company.find_each do |company|
      weeks_of_data.times do |i|
        groups = company.groups_per_week.times.map do
          company.groups.create(event_at: i.weeks.ago)
        end

        i = 0
        company.employees.shuffle.each_slice(Company::GROUP_SIZE) do |employees|
          group = groups[i] || groups.last
          group.employees += employees
          i += 1
        end
      end
    end
  end
end
