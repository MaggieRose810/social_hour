namespace :sample_data do
  desc 'create all'
  task :create_all, [:count] => :environment do |t, args|
    Rake::Task["sample_data:create_sample_companies"].execute(args)
    Rake::Task["sample_data:create_sample_employees"].execute
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
end
