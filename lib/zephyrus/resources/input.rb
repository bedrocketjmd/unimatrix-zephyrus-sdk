module Zephyrus
  class Output < Base
    field :id
    field :created_at
    field :updated_at
    field :state
    field :key
    field :uid

    has_many :outputs
  end
end