module Types
  class QueryType < Types::BaseObject
    field :all_companies, [Types::CompanyType], null: false,
      description: "All the companies"
    def all_companies
      Company.all
    end
  end
end