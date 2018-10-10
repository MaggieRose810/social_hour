namespace :sample_data do
  desc "create sample companies"
  task create_sample_companies: :environment do
    20.times do
      Company.create(name: Faker::Company.name)
    end
  end
end