namespace :sample_data do
  desc 'create sample companies'
  task create_sample_companies: :environment do
    20.times do
      Company.create(name: Faker::Company.name)
    end
  end

  desc 'create sample employees'
  task create_sample_employees: :environment do
    Company.find_each do |company|
      employees = 99.times.map do
          company.employees.build(
          name: Faker::Name.first_name,
          email: Faker::Internet.email
        )
      end
      Employee.import(employees)
    end
  end
end
