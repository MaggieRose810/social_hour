module Types
  class CompanyType < Types::BaseObject
    field :name, String, null: false
    field :id, ID, null: false
  end
end