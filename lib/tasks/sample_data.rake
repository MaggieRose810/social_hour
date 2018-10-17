namespace :sample_data do
  desc 'create all'
  task :create_all, [:count] => :environment do |t, args|

    if args[:count].present?
      Rake::Task["sample_data:create_sample_companies"].execute(args)
      Rake::Task["sample_data:create_sample_employees"].execute
      Rake::Task["sample_data:create_sample_employee_groups"].execute

      client = Kafka.new([ENV["KAFKA_HOST"]], client_id: "social-hour-app")
      Group.find_each do |group|
        GroupMessage.new(group, client).deliver
      end
    else
      puts "You didn't specify how many companies you'd like to create"
    end
  end

  desc 'create sample companies'
  task :create_sample_companies, [:count] => :environment do |t, args|
    args[:count].to_i.times do
      Company.create(name: Faker::Company.name, group_size: 3)
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
    weeks_of_data = 20
    Company.find_each do |company|
      weeks_of_data.times do |i|
          rand_groups = CreateMinimallyPaired.new(company).create
          rand_groups.each do |group|
            GroupScore.new(group).score
          end
      end
    end
  end
end


