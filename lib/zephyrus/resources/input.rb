module Zephyrus
  class Input < Base
    field :id
    field :created_at
    field :updated_at
    field :state
    field :key
    field :uid
    field :uuid

    has_many :outputs
  end
end